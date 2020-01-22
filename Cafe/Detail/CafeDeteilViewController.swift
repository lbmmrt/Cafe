//
//  CafeDeteilViewController.swift
//  Cafe
//
//  Created by Карина Паланчук on 20/01/2020.
//  Copyright © 2020 Karina Palanchuk. All rights reserved.
//

import UIKit

class CafeDeteilViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    var cafe: Cafe?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: cafe!.image)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CafeDetailTableViewCell
        
//        cell.keyLabel.text = "some key text"
//        cell.valueLabel.text = "some key text"

        switch indexPath.row {
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = cafe!.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = cafe!.type
        case 2:
            cell.keyLabel.text = "Адрес"
            cell.valueLabel.text = cafe!.location
        case 3:
            cell.keyLabel.text = "Я здесь был?"
            cell.valueLabel.text = cafe!.isVisited ? "Да" : "Нет"
        default:
            break
        }
        
        return cell
    }
    
    
    
}
