//
//  DailyQuotes.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import Foundation

struct Quote: Codable, Identifiable{
    let id: UUID
    let phrase: String
}
class Quotes: ObservableObject{
    @Published var quotes = [Quote]()
    
    init(){
        loadData()
    }
    func loadData(){
    
            guard let url = Bundle.main.url(forResource: "Data", withExtension: "json")
                else {
                    print("Json file not found")
                    return
                }
            
            let data = try? Data(contentsOf: url)
            let quotes = try? JSONDecoder().decode([Quote].self, from: data!)
            self.quotes = quotes!
            
        
    }
}
