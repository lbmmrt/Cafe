//
//  CafeTableViewController.swift
//  Cafe
//
//  Created by Карина Паланчук on 15/01/2020.
//  Copyright © 2020 Karina Palanchuk. All rights reserved.
//

import UIKit

class CafeTableViewController: UITableViewController {
    
    let restaurantNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    
    let restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CafeTableViewCell
        
        cell.imageCafe.image = UIImage(named: restaurantImages[indexPath.row])
        cell.imageCafe.layer.cornerRadius = 40
        cell.imageCafe.clipsToBounds = true
        cell.nameLebel.text = restaurantNames[indexPath.row]
        
        return cell
    }
    
    func showAlert(index: Int) {
        
        let ac = UIAlertController(title: nil, message: "Выберите дейсвие", preferredStyle: .actionSheet)
        let call = UIAlertAction(title: "Позвонить: 8 (999) 666-11\(index)", style: .default) {
            UIAlertAction in
            showAlert2()
        }
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        ac.addAction(cancel)
        ac.addAction(call)
        present(ac, animated: true, completion: nil)
     
    
    func showAlert2() {
        let cancelCall = UIAlertController(title: nil, message: "Вызов невозможен", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        cancelCall.addAction(ok)
        present(cancelCall, animated: true, completion: nil)
    }
    
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert(index: indexPath.row)
    }
 
}
