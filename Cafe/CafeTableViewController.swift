//
//  CafeTableViewController.swift
//  Cafe
//
//  Created by Карина Паланчук on 15/01/2020.
//  Copyright © 2020 Karina Palanchuk. All rights reserved.
//

import UIKit

class CafeTableViewController: UITableViewController {
    
    var cafe: [Cafe] = [
        Cafe(name: "Ogonёk Grill&Bar", type: "ресторан-бар", location: "Москва", image: "ogonek.jpg", isVisited: false),
        Cafe(name: "Елу", type: "ресторан", location: "Москва", image: "elu.jpg", isVisited: false),
        Cafe(name: "Bonsai", type: "ресторан", location: "Уфа", image: "bonsai.jpg", isVisited: false),
        Cafe(name: "Дастархан", type: "ресторан", location: "Уфа", image: "dastarhan.jpg", isVisited: false),
        Cafe(name: "Индокитай", type: "ресторан", location: "Уфа", image: "indokitay.jpg", isVisited: false),
        Cafe(name: "X.O", type: "ресторан-клуб", location: "Уфа", image: "x.o.jpg", isVisited: false),
        Cafe(name: "Балкан Гриль", type: "ресторан", location: "Уфа", image: "balkan.jpg", isVisited: false),
        Cafe(name: "Respublica", type: "ресторан", location: "Уфа", image: "respublika.jpg", isVisited: false),
        Cafe(name: "Speak Easy", type: "ресторан-клуб", location: "Уфа", image: "speakeasy.jpg", isVisited: false),
        Cafe(name: "Morris Pub", type: "ресторан", location: "Уфа", image: "morris.jpg", isVisited: false),
        Cafe(name: "Вкусные истории", type: "ресторан", location: "Уфа", image: "istorii.jpg", isVisited: false),
        Cafe(name: "Классик", type: "ресторан", location: "Уфа", image: "klassik.jpg", isVisited: false),
        Cafe(name: "Love&Life", type: "ресторан", location: "Уфа", image: "love.jpg", isVisited: false),
        Cafe(name: "Шок", type: "ресторан", location: "Уфа", image: "shok.jpg", isVisited: false),
        Cafe(name: "Бочка", type: "ресторан", location:  "Уфа", image: "bochka.jpg", isVisited: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cafe.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CafeTableViewCell
        
        cell.imageCafe.image = UIImage(named: cafe[indexPath.row].image)
        cell.imageCafe.layer.cornerRadius = 40
        cell.imageCafe.clipsToBounds = true
        cell.nameLebel.text = cafe[indexPath.row].name
        
        if self.cafe[indexPath.row].isVisited {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let ac = UIAlertController(title: nil, message: "Выберите дейсвие", preferredStyle: .actionSheet)
//        let call = UIAlertAction(title: "Позвонить: 8 (999) 666-11\(indexPath.row)", style: .default) {
//            UIAlertAction in
//            showAlert()
//        }
//
//
//        let isVisitedTitle = self.cafeIsVisited[indexPath.row] ? "Я не был здесь" : "Я был здесь"
//        let isVisied = UIAlertAction(title: isVisitedTitle, style: .default) {
//            (action) in
//            let cell = tableView.cellForRow(at: indexPath)
//
//            self.cafeIsVisited[indexPath.row] = !self.cafeIsVisited[indexPath.row]
//            cell?.accessoryType = self.cafeIsVisited[indexPath.row] ? .checkmark : .none
//
//        }
//
//        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//
//        ac.addAction(cancel)
//        ac.addAction(call)
//        ac.addAction(isVisied)
//        present(ac, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//
//        func showAlert() {
//            let cancelCall = UIAlertController(title: nil, message: "Вызов невозможен", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//            cancelCall.addAction(ok)
//            present(cancelCall, animated: true, completion: nil)
    
//        }

 
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
            let defaultText = "Я сейчас в " + self.cafe[indexPath.row].name
            if let image = UIImage(named: self.cafe[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
    
        let delete = UITableViewRowAction(style: .default, title: "Удалить") { (action, indexPath) in
            self.cafe.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        
        share.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return [delete, share]
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detaliSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dvc = segue.destination as! CafeDeteilViewController
                dvc.imageName = self.cafe[indexPath.row].image
            
        }
    }
    
}
}
