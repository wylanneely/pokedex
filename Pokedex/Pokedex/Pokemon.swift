//
//  Pokemon.swift
//  Pokedex
//
//  Created by ALIA M NEELY on 4/18/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation


struct Pokemon {
    
    let name: String
    let id: Int
    let abilities: [String]
  
}


//MARK: - JSON
extension Pokemon {
    
    private static let kName = "name"
    private static let kId = "id"
    private static let kAbilities = "abilities"
    
    init?(pokemonDictionary: [String: Any]) {
        guard let name = pokemonDictionary[Pokemon.kName] as? String,
        let id = pokemonDictionary[Pokemon.kId] as? Int,
            let abilitityDiction = pokemonDictionary[Pokemon.kAbilities] as? [[String: AnyObject]] else {return nil}
        
        
        // the optional chaining "?" searches for "name" key inside of the "ability" keys dictionary, also reuires ANYOBJECT
        let abilities = abilitityDiction.flatMap{ $0["ability"]?["name"] as? String }
        
        self.init(name: name, id: id, abilities: abilities)
        
        
        
        
    }
    
    
    
}



