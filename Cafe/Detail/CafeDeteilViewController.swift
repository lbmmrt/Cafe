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
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: cafe!.image)
        
//        tableView.backgroundColor = #colorLiteral(red: 1, green: 0.7400522134, blue: 0.6560359941, alpha: 1)
//        tableView.separatorColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        title = cafe!.name
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
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
