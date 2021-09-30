//
//  ViewControllerС.swift
//  BondHomework
//
//  Created by Дмитрий Старков on 19.09.2021.
//

import UIKit
import ReactiveKit
import Bond

class ViewControllerCCC: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var findTextField: UITextField!
    
    let array = ["Дима","Антон","Виктор","Денис","Никита","Сергей","Михаил","Андрей"]
    var tableArray = Property(["None"])
    var arrayB = [String]()
    var findArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findTextField.reactive.text
            //.debounce(for: 2.0)
            .observeNext{ [unowned self] text in
                guard let text = text else { return }
                if text != "" {
                    self.findArray.removeAll()
                for element in self.tableArray.value {
                    if element.hasPrefix(text) {
                        self.findArray.append(element)
                    }
            }
                    self.tableArray.value.removeAll()
                    self.tableArray.value = findArray
                } else {
                    tableArray.value.removeAll()
                    tableArray.value = arrayB
                }
            }
        
        
        addButton.reactive.tap
            .observeNext{ [unowned self] in self.tableArray.value.insert(array.randomElement()!, at: 0)
                arrayB = tableArray.value
            }
            
        deleteButton.reactive.tap
            .observeNext{[unowned self] in self.tableArray.value.removeLast()
                arrayB = tableArray.value
            }
        
        tableArray.bind(to: table) { data, indexPaht, table in
            guard let cell = table.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = data[indexPaht.row]
            return cell
        }
    }
    

   

}
