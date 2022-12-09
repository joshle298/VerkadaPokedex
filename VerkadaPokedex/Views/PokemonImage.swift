//
//  PokemonImage.swift
//  VerkadaPokedex
//
//  Created by Joshua Le on 12/8/22.
//

import SwiftUI

struct PokemonImage: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    // image caching?
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 85, height: 85)
            .onAppear {
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                    print("New url, we are caching...")
                } else {
                    getSprite(url: loadedData!)
                    print("using cached url...")
                }
            }
            //.clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
        
    }
    
    func getSprite(url: String) {
        var tempSprite: String?
        
        CurrentPokemonApi().getData(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}

struct PokemonImage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage()
    }
}
