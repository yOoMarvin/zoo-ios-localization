//
//  AnimalTableViewController.swift
//  zoo
//
//  Created by Marvin Messenzehl on 15.02.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class AnimalTableViewController: UITableViewController {

    var animals = [Animal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animals = AnimalResource.getAnimals()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        animals = [Animal]()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return animals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
        
        let animal = animals[indexPath.row]
        cell.textLabel?.text = animal.species
        
        if let animalImg = UIImage(named: animal.image) {
            cell.imageView?.image = animalImg
        }
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailView"{
            guard let indexPath = tableView.indexPathForSelectedRow else  {
                return
            }
            
            let dstCtrl = segue.destination as! ViewController
            dstCtrl.animal = animals[indexPath.row]
        }
    }
 

}
