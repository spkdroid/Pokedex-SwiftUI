//
//  ContentView.swift
//  Pokedex
//
//  Created by Ram on 2021-12-20.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var datas = ReadData()
    
    var body: some View {
        List(datas.users) { user in
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
