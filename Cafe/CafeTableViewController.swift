//
//  CafeTableViewController.swift
//  Cafe
//
//  Created by Карина Паланчук on 15/01/2020.
//  Copyright © 2020 Karina Palanchuk. All rights reserved.
//

import UIKit

class CafeTableViewController: UITableViewController {
    
    var cafeNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    
    var cafeImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    
    var cafeIsVisited = [Bool] (repeating: false, count: 15)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cafeNames.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CafeTableViewCell
        
        cell.imageCafe.image = UIImage(named: cafeImages[indexPath.row])
        cell.imageCafe.layer.cornerRadius = 40
        cell.imageCafe.clipsToBounds = true
        cell.nameLebel.text = cafeNames[indexPath.row]
        
        if self.cafeIsVisited[indexPath.row] {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let ac = UIAlertController(title: nil, message: "Выберите дейсвие", preferredStyle: .actionSheet)
        let call = UIAlertAction(title: "Позвонить: 8 (999) 666-11\(indexPath.row)", style: .default) {
            UIAlertAction in
            showAlert()
        }
        
        
        let isVisitedTitle = self.cafeIsVisited[indexPath.row] ? "Я не был здесь" : "Я был здесь"
        let isVisied = UIAlertAction(title: isVisitedTitle, style: .default) {
            (action) in
            let cell = tableView.cellForRow(at: indexPath)
            
            self.cafeIsVisited[indexPath.row] = !self.cafeIsVisited[indexPath.row]
            cell?.accessoryType = self.cafeIsVisited[indexPath.row] ? .checkmark : .none
            
        }
        
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        ac.addAction(cancel)
        ac.addAction(call)
        ac.addAction(isVisied)
        present(ac, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        func showAlert() {
            let cancelCall = UIAlertController(title: nil, message: "Вызов невозможен", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            cancelCall.addAction(ok)
            present(cancelCall, animated: true, completion: nil)
            
        }
    }
 
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//
//        if editingStyle == .delete {
//            cafeImages.remove(at: indexPath.row)
//            cafeNames.remove(at: indexPath.row)
//            cafeIsVisited.remove(at: indexPath.row)
//        }
//        tableView.deleteRows(at: [indexPath], with: .fade)
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (action, indexPath) in
            let defaultText = "Я сейчас в " + self.cafeNames[indexPath.row]
            if let image = UIImage(named: self.cafeImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
    
        let delete = UITableViewRowAction(style: .default, title: "Удалить") { (action, indexPath) in
            self.cafeImages.remove(at: indexPath.row)
            self.cafeNames.remove(at: indexPath.row)
            self.cafeIsVisited.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        share.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return [delete, share]
}
    
    
}
