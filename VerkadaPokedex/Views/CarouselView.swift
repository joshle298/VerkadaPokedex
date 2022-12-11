//
//  CarouselView.swift
//  VerkadaPokedex
//
//  Created by Joshua Le on 12/8/22.
//

import SwiftUI

struct CarouselView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    private func getScale(proxy: GeometryProxy) -> CGFloat {
        var scale : CGFloat = 1
        
        let x = proxy.frame(in: .global).minX
        
        let diff = abs(x)
        if (diff < 100) {
            scale = 1 + (100 - diff) / 500
        }
        
        return scale
    }
    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                HStack() {
                    ForEach(searchText == "" ? pokemon : pokemon.filter( {
                        $0.name.contains(searchText.lowercased())
                    })) { entry in
                        // proxy = where curr box is
                        GeometryReader { proxy in
                            NavigationLink(
                                destination: Text("Detail view for \(entry.name)"),
                                label: {
                                    let scale = getScale(proxy: proxy)
                                    VStack {
                                        Text(entry.name)
                                            .foregroundColor(Color.black)
                                        PokemonImage(imageLink: "\(entry.url)") // Pokemon Image
                                    }
                                    .padding(.top, 100)
                                    .scaledToFill()
                                    .frame(width: 110)
                                    .clipped()
                                    .cornerRadius(5)
                                    .shadow(radius: 15)
                                    .scaleEffect(CGSize(width: scale, height: scale))
                                    .background(Color.clear)
                                })
                            
                        }
                        .frame(width: 120, height: 500)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .onAppear {
                PokeApi().getData() { pokemon in
                    self.pokemon = pokemon
                    for pokemon in pokemon {
                        print(pokemon.name)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("PokedexUI")
        }
    }
    
    struct CarouselView_Previews: PreviewProvider {
        static var previews: some View {
            CarouselView()
        }
    }
    
}
