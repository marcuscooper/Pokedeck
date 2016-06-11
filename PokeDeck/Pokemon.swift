//
//  Pokemon.swift
//  PokeDeck
//
//  Created by Marcus Cooper on 6/11/16.
//  Copyright © 2016 SZLSoft. All rights reserved.
//

import Foundation

class Pokemon
{
    
    private var _name: String!
    private var _pokedeckId: Int!
    
    var name: String
    {
        return _name
    }
    
    var pokedeckId: Int
    {
        return _pokedeckId
    }
    
    init(name: String, pokedeckId: Int)
    {
        self._name = name
        self._pokedeckId = pokedeckId
    }
}