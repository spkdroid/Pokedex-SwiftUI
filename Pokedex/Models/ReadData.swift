//
//  ReadData.swift
//  Pokedex
//
//  Created by Ram on 2021-12-20.
//

import Foundation

class ReadData: ObservableObject  {
    @Published var users = [Pokedex]()
    
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "pokemon", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([Pokedex].self, from: data!)
        self.users = users!
    }
     
}
