//
//  Pokemon.swift
//  VerkadaPokedex
//
//  Created by Joshua Le on 12/7/22.
//
// https://pokeapi.co/api/v2/pokemon?limit=20&offset=0

import Foundation
import UIKit

var offset = 0

struct Pokemon : Codable {
    // array of pokemon entries
    var results: [PokemonEntry]
}

struct PokemonEntry: Codable, Identifiable {
    // unique ID for each pokemon
    let id = UUID()
    var name: String
    var url: String
}

class PokeApi {
    // when loaded, send data
    func getData(completion: @escaping ([PokemonEntry]) -> ()) {
        guard let url = URL(string: "https://pokeapi.co/api/v2/pokemon?limit=200&offset=\(offset)") else {
            return
        }
        offset += 21
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else {
                return
            }
            
            let pokemonList = try! JSONDecoder().decode(Pokemon.self, from: data)
            
            DispatchQueue.main.async {
                completion(pokemonList.results)
            }
        }.resume()
    }
    
}
