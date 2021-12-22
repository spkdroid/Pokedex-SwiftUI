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
        VStack(alignment: .leading,spacing: 0) {
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
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.black)
            Text(user.xdescription)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    }
}

