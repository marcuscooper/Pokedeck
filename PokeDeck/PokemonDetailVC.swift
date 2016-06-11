//
//  PokemonDetailVC.swift
//  PokeDeck
//
//  Created by Marcus Cooper on 6/11/16.
//  Copyright © 2016 SZLSoft. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController
{
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedeckIdLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var nextEvoNameLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!

    var pokemon: Pokemon!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        name.text = pokemon.name
    }
    @IBAction func backBtnPressed(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
