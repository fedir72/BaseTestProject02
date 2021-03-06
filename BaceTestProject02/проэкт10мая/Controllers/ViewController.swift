//
//  ViewController.swift
//  проэкт10мая
//
//  Created by mac os on 10.05.2019.
//  Copyright © 2019 mac os. All rights reserved.
//

import UIKit


protocol MyProtocol {
    func createUsers()
}

class ViewController: UIViewController,MyProtocol,AddItemViewControllerDelegate {
   
    
   
    
    
    var users = [Test]()
    
    @IBOutlet weak var tableview: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        
        createUsers()
    }
    
    
    func createUsers() {
        
        let oneUser = Test(name: "Din", lastName: "Rid", bornDate: "01,09,1981", imageName: "man1", city: "Tokyo")
        let twoUser = Test(name: "JacK", lastName: "Nickolson", bornDate: "8,09,1965", imageName: "man2", city: "Kiev")
        let threeUser = Test(name: "Nick", lastName: "Tornton", bornDate: "05,12,1786", imageName: "man3", city: "London")
        let fourUser = Test(name: "Nuki", lastName: "Hacki", bornDate: "11,10,1954", imageName: "man4", city: "Corror")
        
        users.append(oneUser)
        users.append(twoUser)
        users.append(threeUser)
        users.append(fourUser)
    }
    func didCreateItem(item: Test) {
        self.users.append(item)
        self.tableview.reloadData()
    }
    
    
    
    @IBAction func addItemBarButton(_ sender: UIBarButtonItem) {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "AddItemViewController") as? AddItemViewController {
            controller.delegate = self
        self.present(controller,animated: true,completion: nil)
    }
        }
    

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       //проверка наличия таблицы
        if let cell = tableView.dequeueReusableCell(withIdentifier: "testCell", for: indexPath) as? TestTableViewCell {
            
            //создаем обьект значение для передачи данных
            let item = self.users[indexPath.row]
        
        //применяем функцию рефреш из ячейки
        cell.refresh(item)
            
        return cell
            
        }
       return UITableViewCell()
    }
    //высота ячейки вручную
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 270
    }
    
    
}

