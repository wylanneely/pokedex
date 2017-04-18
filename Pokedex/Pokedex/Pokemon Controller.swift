//
//  Pokemon Controller.swift
//  Pokedex
//
//  Created by ALIA M NEELY on 4/18/17.
//  Copyright © 2017 Wylan. All rights reserved.
//

import Foundation


class PokemonController {
    
    static let baseUrl = URL(string:"http://pokeapi.co/api/v2/pokemon/")
    
    //FEtch 
    
    static func fetchPokemon(for searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        //APPENDING PATH COMPONENTS USING THE URL METHOD ___ DONT USE +=
        guard let url = baseUrl?.appendingPathComponent(searchTerm) else {  completion(nil); return}
        
        NetworkController.performRequest(for: url, httpMethod: .get) { data, error in
            //body of closure      PARAMETERS
            //COnvert the data into a json dictionay format, guard against it being nil
            
            guard let data = data, let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else {
                completion(nil); return }
            
            let pokemon = Pokemon(pokemonDictionary: jsonDictionary)
            
            completion(pokemon)
            
            
            }
    }
        
}
    
    
    
    
    
