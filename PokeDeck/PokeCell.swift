//
//  PokeCell.swift
//  PokeDeck
//
//  Created by Marcus Cooper on 6/11/16.
//  Copyright © 2016 SZLSoft. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell
{
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 8.0
    }
    
    func configureCell(pokemon: Pokemon)
    {
        self.pokemon = pokemon
        
        nameLbl.text = self.pokemon.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokemon.pokedeckId)")
    }
}
