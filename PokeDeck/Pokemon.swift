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
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    
    var name: String
    {
        return _name
    }
    
    var pokedeckId: Int
    {
        return _pokedeckId
    }
    
    var description: String
    {
        return _description
    }
    
    var type: String
    {
        return _type
    }
    
    var defense: String
    {
        return _description
    }
    
    var height: String
    {
        return _height
    }
    
    var weight: String
    {
        return _weight
    }
    
    var attack: String
    {
        return _attack
    }
    
    var nextEvolutionTxt: String
    {
        return _nextEvolutionTxt
    }
    
    init(name: String, pokedeckId: Int)
    {
        self._name = name
        self._pokedeckId = pokedeckId
    }
}