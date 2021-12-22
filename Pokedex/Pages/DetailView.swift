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
        Text(user.name)
    }
}

