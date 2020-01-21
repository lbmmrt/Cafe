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
    
    
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage(named: imageName)
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
        
        cell.keyLabel.text = "some key text"
        cell.valueLabel.text = "some key text"

        return cell
    }
    
    
    
}
