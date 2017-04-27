//
//  ViewController.swift
//  Pokedex2
//
//  Created by Hasibul Shishir on 4/26/17.
//  Copyright © 2017 Hasibul Shishir. All rights reserved.
//

import UIKit
import AVFoundation

class MainVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

   
    //Array:
    var pokemon = [Pokemon]()
    
    //Music player
    var musicPlayer: AVAudioPlayer!
    
    
    @IBOutlet weak var myCollectionView: UICollectionView!
   // var pokemon: Pokemon!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioInit()
        parsePokemonCsv()
    
    
    }
    
    func audioInit(){
        let path = Bundle.main.path(forResource: "music", ofType: "mp3")!
        
        do{
            
            musicPlayer = try AVAudioPlayer(contentsOf: URL(string: path)!)
            musicPlayer.prepareToPlay()
            musicPlayer.numberOfLoops = -1
            //musicPlayer.play()
        }catch let err as NSError{
            print(err.debugDescription)
        }
    }
    
    func parsePokemonCsv(){
        
        let path = Bundle.main.path(forResource: "pokemon", ofType: "csv")!
        
        do{
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            //print(rows)
            
            for row in rows{
                let pokeId = Int(row["id"]!)!
                let name = row["identifier"]!
                
                let poke = Pokemon(name: name, pokedexId: pokeId)
                pokemon.append(poke)
            }
            
        }catch let err as NSError{
            print(err.debugDescription)
        }
        
    
        
}
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return pokemon.count
    }
    
    
    //let var path =
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokeCell", for: indexPath) as? PokeCell{
            
            let poke = pokemon[indexPath.row]
            
            cell.configureCell(poke)
            
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
    
    
    @IBAction func musicBtnPressed(_ sender: UIButton) {
        
        if musicPlayer.isPlaying {
            musicPlayer.pause()
            sender.alpha = 0.3
        }else{
            musicPlayer.play()
            sender.alpha = 1
        }
        
    }

    

}

