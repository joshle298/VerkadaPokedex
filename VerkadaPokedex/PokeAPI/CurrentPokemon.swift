//
//  CurrentPokemon.swift
//  VerkadaPokedex
//
//  Created by Joshua Le on 12/8/22.
//

import Foundation

struct CurrentPokemon: Decodable {
    var sprites: PokemonSprites
    var types : [PokemonTypes]
}

struct PokemonSprites: Decodable {
    var front_default: String
}

struct PokemonTypes: Decodable {
    let type: PokemonTypeName
}

struct PokemonTypeName: Decodable {
    let name: String
}

class CurrentPokemonApi {
    // when loaded, send data
    func getImageURL(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            
            let pokemonSprite = try! JSONDecoder().decode(CurrentPokemon.self, from: data)
            // print(pokemonSprite)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
    
    func getType(url: String, completion: @escaping ([PokemonTypes]) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        
        var done = [PokemonTypes]()
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            
            let pokemonType = try! JSONDecoder().decode(CurrentPokemon.self, from: data)
            // print(pokemonSprite)
            // print(done.first)
            
            DispatchQueue.main.async {
                completion(pokemonType.types)
            }
        }.resume()
    }
}

