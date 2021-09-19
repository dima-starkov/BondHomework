//
//  ViewControllerDD.swift
//  BondHomework
//
//  Created by Дмитрий Старков on 19.09.2021.
//

import UIKit
import ReactiveKit
import Bond

class ViewControllerDD: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var counter = Property(0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        counter.map{ "counter:\($0)"}
            .bind(to: label.reactive.text)
        
        button.reactive.tap
            .observeNext{ self.counter.value += 1 }
        
    }
    

    

}
