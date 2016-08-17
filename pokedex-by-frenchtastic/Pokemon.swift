//
//  Pokemon.swift
//  pokedex-by-frenchtastic
//
//  Created by Romain Pardon on 15/08/2016.
//  Copyright © 2016 SlasherApp. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    
    var name: String {
        get {
            return _name
        }
    }
    
    var pokedexId: Int {
        get {
            return _pokedexId
        }
    }
    
    init(name: String, pokedexId: Int)
    {
        self._name = name
        self._pokedexId = pokedexId
    }
}