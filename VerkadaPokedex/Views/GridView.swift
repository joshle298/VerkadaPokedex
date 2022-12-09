//
//  GridView.swift
//  VerkadaPokedex
//
//  Created by Joshua Le on 12/8/22.
//

import SwiftUI

struct GridView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    let data = (1...100).map { "Item \($0)" }
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(searchText == "" ? pokemon : pokemon.filter( {
                        $0.name.contains(searchText.lowercased())
                    })) { entry in
                        NavigationLink(
                        destination: Text("Detail view for \(entry.name)"),
                        label: {
                            VStack {
                                PokemonImage(imageLink: "\(entry.url)") // Pokemon Image
                                Text("\(entry.name)").foregroundColor(Color.white).lineLimit(1)
                                    .font(.system(size: 15))
                                // Text("\(entry.type)")
                            }
                            .padding()
                            .foregroundColor(.white)
                            .background(.pink)
                            .clipShape(
                                
                                // 3
                                RoundedRectangle(
                                    cornerRadius: 20,
                                    style: .continuous
                                ))
                        })
                    }
                }
                .padding(.horizontal)
            }
            .searchable(text: $searchText)
            .navigationTitle("PokedexUI")
        }
        .onAppear {
            PokeApi().getData() { pokemon in
                self.pokemon = pokemon
                for pokemon in pokemon {
                    print(pokemon.name)
                }
            }
        }
    }
    
    struct GridView_Previews: PreviewProvider {
        static var previews: some View {
            GridView()
        }
    }
}
