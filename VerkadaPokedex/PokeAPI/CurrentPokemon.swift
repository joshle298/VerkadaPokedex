//
//  CurrentPokemon.swift
//  VerkadaPokedex
//
//  Created by Joshua Le on 12/8/22.
//

import Foundation

struct CurrentPokemon: Codable {
    var sprites: PokemonSprites
    var weight: Int
}

struct PokemonSprites: Codable {
    var front_default: String
    // var type: String
}

class CurrentPokemonApi {
    // when loaded, send data
    func getData(url: String, completion: @escaping (PokemonSprites) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            
            let pokemonSprite = try! JSONDecoder().decode(CurrentPokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonSprite.sprites)
            }
        }.resume()
    }
}
