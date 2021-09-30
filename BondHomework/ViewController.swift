//
//  ViewController.swift
//  BondHomework
//
//  Created by Дмитрий Старков on 11.09.2021.
//

import UIKit
import ReactiveKit
import Bond


class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        emailTextField.reactive.text
//            .map { [unowned self] in
//                self.isCorrectedEmail(email: $0 ?? " ") ? " " : "Некорректтная почта"
//            }.bind(to: infoLabel)
//
//
//        passwordTextField.reactive.text
//            .map{ $0?.count ?? 0  > 6 ? " " : "Слишком короткий пароль"}
//            .bind(to: infoLabel)
        
        combineLatest(emailTextField.reactive.text, passwordTextField.reactive.text)
            .map{ [unowned self] in
                if !self.isCorrectedEmail(email: $0 ?? "") {
                    return "Некорректная почта"
                } else if $1?.count ?? 0 < 6 {
                    return "Некорректный пароль"
                } else {
                    return ""
                }
            }.bind(to: infoLabel.reactive.text)
           
        combineLatest(emailTextField.reactive.text, passwordTextField.reactive.text)
            .map{ [unowned self] in
                self.isCorrectedEmail(email: $0 ?? "") && $1?.count ?? 0 >= 6
            }.bind(to: button.reactive.isEnabled)
           
    }
    
    private func isCorrectedEmail(email: String)-> Bool {
        let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
        let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
        let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,8}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }


}

