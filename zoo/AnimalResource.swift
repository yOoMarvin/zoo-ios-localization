//
//  AnimalResource.swift
//  zoo
//
//  Created by Marvin Messenzehl on 15.02.17.
//  Copyright © 2017 Marvin Messenzehl. All rights reserved.
//

import Foundation

struct AnimalResource {
    static func getAnimals() -> [Animal] {
        
        var animals = [Animal]()
        
        // check property list
        guard let path = Bundle.main.path(forResource: "animals", ofType: "plist") else {
            return animals
        }
        
        guard let plist = NSArray(contentsOfFile: path) else {
            return animals
        }
        
        //process
        for dictionary in plist {
            let dict = dictionary as! NSDictionary
            animals.append(Animal(
                species: dict["species"] as! String,
                link: dict["link"] as! String,
                image: dict["image"] as! String,
                description: dict["description"] as! String
            ))
        }
        
        return animals
    }
}
