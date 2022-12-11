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
    @State var cardBackground = []
    var color = ""
    @State var index = 0
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(searchText == "" ? pokemon : pokemon.filter( {
                        $0.name.contains(searchText.lowercased())
                    })) { entry in
                        NavigationLink(
                            destination: Text("Further Detail on \(entry.name.capitalized) (further API implementation needed)"),
                            label: {
                                VStack {
                                    PokemonImage(imageLink: "\(entry.url)") // Pokemon Image
                                    Text("\(entry.name.capitalized)").foregroundColor(Color.white).lineLimit(1)
                                        .font(.system(size: 14))
                                    // Text("\(entry.type)")
                                }
                                .padding()
                                .foregroundColor(.white)
                                .background(.pink)
                                .clipShape(
                                    // 3
                                    RoundedRectangle(
                                        cornerRadius: 15,
                                        style: .continuous
                                    ))
                            })
//                        .onAppear() {
//                            CurrentPokemonApi().getType(url: entry.url) { tColor in
//                                cardBackground = tColor
//                                print(cardBackground.first)
//                            }
//                        }
                    }
                }
                .padding(.horizontal)
            }
            .searchable(text: $searchText)
            .navigationTitle("Verkada Pokedex")
        }
        .onAppear() {
            PokeApi().getData() { pokemon in
                self.pokemon = self.pokemon + pokemon
            }
        }
        .refreshable() {
            PokeApi().getData() { pokemon in
                self.pokemon = self.pokemon + pokemon
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
