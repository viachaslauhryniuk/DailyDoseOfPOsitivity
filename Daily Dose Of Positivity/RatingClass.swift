//
//  RatingClass.swift
//  Daily Dose Of Positivity
//
//  Created by Слава Гринюк on 14.11.23.
//

import Foundation
class Ratings: ObservableObject{
    @Published var ratings = [Int](){
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(ratings){
                UserDefaults.standard.set(encoded, forKey: "Ratingss")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Ratingss") {
            if let decodedItems = try? JSONDecoder().decode([Int].self, from: savedItems) {
                ratings = decodedItems
                return
            }
        }

        ratings = []
    }
    
}
