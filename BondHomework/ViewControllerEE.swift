//
//  ViewControllerEE.swift
//  BondHomework
//
//  Created by Дмитрий Старков on 19.09.2021.
//

import UIKit
import ReactiveKit
import Bond

class ViewControllerEE: UIViewController {

    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
     var isTapped1 = Property(false)
     var isTapped2 = Property(false)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.reactive.tap
            .observeNext{ [unowned self] in self.isTapped1.value = true }
            
        button2.reactive.tap
            .observeNext{ [unowned self] in self.isTapped2.value = true }
        
        combineLatest(isTapped1, isTapped2)
            .map {$0 && $1 ? "Ракета Запущена" : ""}
            .bind(to: self.label.reactive.text)
        
    }
    

   

}
