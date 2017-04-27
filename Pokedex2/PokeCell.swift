//
//  PokeCell.swift
//  Pokedex2
//
//  Created by Hasibul Shishir on 4/26/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var pokeLbl: UILabel!
    
    var pokemon: Pokemon!
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }
    
    
    func configureCell(_ pokemon: Pokemon){
        
        self.pokemon = pokemon
        
        pokeLbl.text = self.pokemon.name
        pokemonImage.image = UIImage(named: "\(self.pokemon.pokedexId)")
        
    }
    
}
