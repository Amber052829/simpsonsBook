//
//  ViewController.swift
//  Simpsons Character Book
//
//  Created by Amber Sethi on 01/02/18.
//  Copyright © 2018 Amber Sethi. All rights reserved.
//

import UIKit

class TableVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

  
    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpson]()
    var chosenSimpson = Simpson()

    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //tableView setup
        tableView.delegate = self
        tableView.dataSource = self
        
        //creating characters
        
        let homer = Simpson()
        homer.name = "Homer Simpson"
        homer.occupation = "Nuclear Safety Inspector"
        homer.image = UIImage(named: "homer.png")!
        
        
        let bart = Simpson()
        bart.name = "Bart Simpson"
        bart.occupation = "Student"
        bart.image = UIImage(named: "bart.png")!
        
        let marge = Simpson()
        marge.name = "Marge Simpson"
        marge.occupation = "Homermaker"
        marge.image = UIImage(named: "marge.png")!
        
        let ned = Simpson()
        ned.name = "Ned Flanders"
        ned.occupation = "Pharmacist"
        ned.image = UIImage(named: "ned.png")!
        
        mySimpsons.append(homer)
        mySimpsons.append(bart)
        mySimpsons.append(marge)
        mySimpsons.append(ned)
        
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle:   UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            mySimpsons.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .middle)
            tableView.endUpdates()
        }
    }
    

//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        //tableView element deletion
//        if editingStyle == .delete {
//            mySimpsons.remove(at: indexPath.row)
//            mySimpsons.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
//        }
//    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
        let destinationVC = segue.destination as! DetailVC
        destinationVC.selectedSimpson = self.chosenSimpson
    }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailVC", sender: nil)
    }
    
    

}

