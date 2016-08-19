//
//  PokemonDetailVC.swift
//  pokedex-by-frenchtastic
//
//  Created by Romain Pardon on 17/08/2016.
//  Copyright © 2016 SlasherApp. All rights reserved.
//

import UIKit
import Alamofire

class PokemonDetailVC: UIViewController {
    
    var pokemon: Pokemon!

    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var nextEvoLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = pokemon.name.capitalizedString
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        pokemon.downloadPokemonDetails {
            self.updateUI()
        }
        
    }
    
    func updateUI() {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        pokedexLbl.text = "\(pokemon.pokedexId)"
        baseAttackLbl.text = pokemon.attack
        
        if pokemon.nextEvolutionId == "" {
            nextEvoLbl.text = "No Evolutions"
            nextEvoImg.hidden = true
        } else {
            nextEvoImg.hidden = false
            nextEvoImg.image = UIImage(named: pokemon.nextEvolutionId)
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionLvl != "" {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
            }
            nextEvoLbl.text = str
        }
    }
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
