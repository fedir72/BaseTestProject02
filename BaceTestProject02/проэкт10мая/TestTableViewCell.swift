//
//  TestTableViewCell.swift
//  проэкт10мая
//
//  Created by mac os on 10.05.2019.
//  Copyright © 2019 mac os. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    
  public  func refresh(_ model: Test) {
        //создаем ячейку таблицы для обьекта
        nameLabel.text = "Name: " + model.name
        lastNameLabel.text = "Last Name: " + model.lastName
        dateLabel.text = "BornDate: " + model.bornDate
        imageName.image = UIImage(named: model.imageName)
       cityLabel.text = "City of residence: " + model.city
    }
    
}
