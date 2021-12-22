//
//  DetailView.swift
//  Pokedex
//
//  Created by Ram on 2021-12-21.
//

import SwiftUI


struct DetailView: View {
    
    let user:Pokedex
    
    init (user:Pokedex) {
        self.user = user
    }
    
    var body: some View{
        VStack(alignment: .center) {
            AsyncImage(url: URL(string: user.imageurl)
                       ,content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 400, maxHeight: 250)
            },
                       placeholder: {
                ProgressView()
            })
            Text(user.name)
        }
    }
}

