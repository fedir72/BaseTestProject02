//
//  AddItemViewController.swift
//  проэкт10мая
//
//  Created by mac os on 12.05.2019.
//  Copyright © 2019 mac os. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate: class {
    func didCreateItem(item: Test )
}

class AddItemViewController: UIViewController {
    
    weak var delegate: AddItemViewControllerDelegate?
    
    @IBOutlet weak var cityLabel: UITextField!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var lastNameLabel: UITextField!
    @IBOutlet weak var bornDateLabel: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func exitButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        if let name = self.nameLabel.text, let lastName = self.lastNameLabel.text, let bornDate = self.bornDateLabel.text, let city = self.cityLabel.text,name.isEmpty == false,lastName.isEmpty == false, bornDate.isEmpty == false, city.isEmpty == false {
            self.createItem(name: name, lastName: lastName, bornDate: bornDate,city: city)
        }else {
            self.alert(title: "ахтунг", message: "Введите все данные")
        }
        
        
        
    }
    func createItem(name: String,lastName: String, bornDate: String, city: String) {
        let item = Test(name: name, lastName: lastName, bornDate: bornDate, imageName: "man7", city: city)
        //делегируем полномочия
        self.delegate?.didCreateItem(item: item)
        self.dismiss(animated: true, completion: nil)
    }

}
extension AddItemViewController{
    func alert(title: String,message: String) {
        let alertcontroller = UIAlertController(title: nil, message: "Enter All Data", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertcontroller.addAction(action)
        self.present(alertcontroller,animated:  true,completion: nil)
    }
}
