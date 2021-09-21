//
//  ViewControllerB.swift
//  BondHomework
//
//  Created by Дмитрий Старков on 19.09.2021.
//

import UIKit
import ReactiveKit
import Bond

class ViewControllerB: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.reactive.text
            .debounce(for: 2.0)
            .map {"отправка запроса для \($0 ?? "")"}
            .observeNext{ print($0)}

    }
    

    

}
