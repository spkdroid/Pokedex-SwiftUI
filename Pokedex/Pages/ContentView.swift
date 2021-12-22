//
//  ContentView.swift
//  Pokedex
//
//  Created by Ram on 2021-12-20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var datas = ReadData()
    @State private var fullText: String = ""
    @State private var searchText = ""
    
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(searchResults, id: \.self) {
                        user in
                        NavigationLink(destination: DetailView()) {
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color.gray)
                                HStack{
                                    Text(user.weight)
                                        .font(.title3)
                                        .foregroundColor(Color.red)
                                    
                                    Spacer()
                                    Text(user.category)
                                        .font(.title3)
                                    
                                }
                                AsyncImage(url: URL(string: user.imageurl)
                                           ,content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 200, maxHeight: 125)
                                },
                                           placeholder: {
                                    ProgressView()
                                })
                            }
                        }.navigationBarTitle("Pokedex")
                    }
                }.searchable(text: $searchText)
            }
        }
    }
    var searchResults: [Pokedex] {
        if searchText.isEmpty {
            return datas.users
        } else {
            return datas.users.filter { ($0.name).contains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
