//
//  ViewController.swift
//  zoo
//
//  Created by Marvin Messenzehl on 15.02.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animal: Animal?
    
    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func infosTapped(_ sender: Any) {
        
        let title = NSLocalizedString("Mehr Infos", comment: "mehr infos button")
        let msg = NSLocalizedString("Ein Projekt von Marvin Messenzehl", comment: "powered by msg")
        let buttonText = NSLocalizedString("Akzeptieren", comment: "ok button")
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    func initAnimal() {
        guard let animal = animal else {
            let _ = navigationController?.popViewController(animated: true)
            return
        }
        
        titleLabel.text = animal.species
        descriptionLabel.text = animal.description
        
        if let img = UIImage(named: animal.image) {
            imageView.image = img
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initAnimal()

    }

   
    


}

