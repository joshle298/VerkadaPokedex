//
//  ContentView.swift
//  VerkadaPokedex
//
//  Created by Joshua Le on 12/7/22.
//

import SwiftUI

struct ContentView: View {
    var carousel = true
    
    var body: some View {
        GridView()
//            List {
//                ForEach(searchText == "" ? pokemon : pokemon.filter( {
//                    $0.name.contains(searchText.lowercased())
//                })) { entry in
//                    HStack {
//                        PokemonImage(imageLink: "\(entry.url)") // Pokemon Image
//                            .padding(.trailing, 20)
//                        NavigationLink("\(entry.name)".capitalized, destination: Text("Detail view for \(entry.name)"))
//                    }
//                }
//            }
//            .onAppear {
//                PokeApi().getData() { pokemon in
//                    self.pokemon = pokemon
//                    for pokemon in pokemon {
//                        print(pokemon.name)
//                    }
//                }
//            }
//            .searchable(text: $searchText)
//            .navigationTitle("PokedexUI")

        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
