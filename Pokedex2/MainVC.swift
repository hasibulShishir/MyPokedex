//
//  ViewController.swift
//  Pokedex2
//
//  Created by Hasibul Shishir on 4/26/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

   
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var pokemon: Pokemon!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 719
    }
    
    
    //let var path =
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            let pokemon = Pokemon(name: "Pokemon", pokedexId: indexPath.row)
            
            cell.configureCell(pokemon: pokemon)
            
            return cell
        }else{
           
            return UICollectionViewCell()
        }
        
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
    

    

}

