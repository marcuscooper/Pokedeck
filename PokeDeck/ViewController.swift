//
//  ViewController.swift
//  PokeDeck
//
//  Created by Marcus Cooper on 6/10/16.
//  Copyright © 2016 SZLSoft. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UITextFieldDelegate
{
    @IBOutlet weak var collection: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var pokemon = [Pokemon]()
    var filteredPokemon = [Pokemon]()
    var musicPlayer: AVAudioPlayer!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collection.delegate = self
        collection.dataSource = self
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.Done
        parsePokemonCsv()
        initAudio()
    }
    
    func initAudio()
    {
        let path = NSBundle.mainBundle().pathForResource("music", ofType: "mp3")!
        
        do
        {
            musicPlayer = try AVAudioPlayer(contentsOfURL: NSURL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            musicPlayer.play()
        } catch let err as NSError
        {
            print(err.debugDescription)
        }
    }
    
    func parsePokemonCsv()
    {
        let path = NSBundle.mainBundle().pathForResource("pokemon", ofType: "csv")!
        
        do
        {
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows
            {
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                pokemon.append(Pokemon(name: name, pokedeckId: pokeId))
            }
        } catch let err as NSError
        {
            print(err.debugDescription)
        }
        filteredPokemon = pokemon
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(105, 105)
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return filteredPokemon.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PokeCell", forIndexPath: indexPath) as? PokeCell
        {
            let currentPokemon = filteredPokemon[indexPath.row]
            
            cell.configureCell(currentPokemon)
            return cell
        } else
        {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        
    }
    
    @IBAction func musicBtnPressed(sender: UIButton)
    {
        if musicPlayer.playing
        {
            musicPlayer.stop()
            sender.alpha = 0.45
        } else
        {
            musicPlayer.play()
            sender.alpha = 1.0
        }
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) // called when text changes (including clear)
    {
        var lower: String!
        if searchBar.text == nil || searchBar.text == ""
        {
            lower = ""
            filteredPokemon = pokemon
            closeKeyboard()
        } else
        {
            lower = searchBar.text!.lowercaseString
            filteredPokemon = pokemon.filter({$0.name.rangeOfString(lower) != nil})
        }
        
        collection.reloadData()
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar)
    {
        closeKeyboard()
    }
    
    func closeKeyboard()
    {
        view.endEditing(true)
    }
}

