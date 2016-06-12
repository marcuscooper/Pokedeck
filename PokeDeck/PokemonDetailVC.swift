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
        
        name.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedeckId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails
        { () -> () in
            //this will be called after download is done
            self.updateUI()
        }
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        descriptionLbl.text = ""
        typeLbl.text = ""
        defenseLbl.text = ""
        heightLbl.text = ""
        pokedeckIdLbl.text = ""
        weightLbl.text = ""
        baseAttackLbl.text = ""
        nextEvoNameLbl.text = ""
        nextEvoImg.hidden = true
    }
    
    func updateUI()
    {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type.capitalizedString
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        baseAttackLbl.text = pokemon.attack
        pokedeckIdLbl.text = "\(pokemon.pokedeckId)"
        if pokemon.nextEvolutionId != ""
        {
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            nextEvoImg.hidden = false
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            if pokemon.nextEvolutionLevel != ""
            {
                str += " - LVL \(pokemon.nextEvolutionLevel)"
            }
            
            nextEvoNameLbl.text = str
        } else
        {
            nextEvoNameLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        }
    }
    
    @IBAction func backBtnPressed(sender: AnyObject)
    {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
