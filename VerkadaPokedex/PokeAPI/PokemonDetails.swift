//
//  PokemonDetails.swift
//  VerkadaPokedex
//
//  Created by Joshua Le on 12/10/22.
//

import Foundation

struct MoreSpecificPokemon: Decodable {
    var sprites: PokemonTypes
    var order : Int
    var name : String
    var types : [PokemonTypeTypes]
}

struct PokemonTypes: Codable {
    var front_default: String
}

class DetailPokemonApi {
    // when loaded, send data
    func getData(url: String, completion: @escaping (PokemonTypes) -> ()) {
        guard let url = URL(string: url) else {
            return
        }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            let pokemonType = try! JSONDecoder().decode(MoreSpecificPokemon.self, from: data)
            
            print(pokemonType)
            DispatchQueue.main.async {
                completion(pokemonType.sprites)
            }
        }.resume()
    }
}

