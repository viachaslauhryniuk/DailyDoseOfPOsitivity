//
//  ActsStruct.swift
//  Daily Dose Of Positivity
//
//  Created by Слава Гринюк on 14.11.23.
//

import Foundation
struct Act: Codable, Identifiable{
    let id: UUID
    let name: String
    let symbol: String
    var isPinned:Bool
}
class Acts: ObservableObject{
    @Published var acts = [Act]()
    
    init(){
        loadData()
    }
    func loadData(){
    
            guard let url = Bundle.main.url(forResource: "Acts", withExtension: "json")
                else {
                    print("Json file not found")
                    return
                }
            
            let data = try? Data(contentsOf: url)
            let acts = try? JSONDecoder().decode([Act].self, from: data!)
            self.acts = acts!
            
        
    }
}
