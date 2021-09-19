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
    
    let array = ["Дима","Антон","Виктор","Денис","Никита","Сергей","Михаил","Андрей"]
    var tableArray = Property(["ll"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.reactive.tap
            .observeNext{ [unowned self] in self.tableArray.value.append(self.array.randomElement()!)}
            
        deleteButton.reactive.tap
            .observeNext{[unowned self] in self.tableArray.value.removeLast()}
        
        tableArray.bind(to: table) { data, indexPaht, table in
            guard let cell = table.dequeueReusableCell(withIdentifier: "cell") else { return UITableViewCell() }
            cell.textLabel?.text = data[indexPaht.row]
            return cell
        }
    }
    

   

}
