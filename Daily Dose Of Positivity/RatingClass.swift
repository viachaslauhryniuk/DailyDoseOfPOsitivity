//
//  RatingClass.swift
//  Daily Dose Of Positivity
//
//  Created by Слава Гринюк on 14.11.23.
//

import Foundation
enum UserMood: String,Encodable,Decodable {
    case glowing = "🥳 Glowing"
    case happy = "🙂 Happy"
    case neutral = "😐 Neutral"
    case sad = "😕 Sad"
    case verysad = "😡 Very sad"
    
    
    var score: Int {
        switch self {
            case .glowing: return 5
            case .happy: return 4
            case .neutral: return 3
            case .sad: return 2
            case .verysad: return 1

        }
    }
}
class Ratings: ObservableObject{
    @Published var ratings = [UserMood](){
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(ratings){
                UserDefaults.standard.set(encoded, forKey: "Ratingss")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Ratingss") {
            if let decodedItems = try? JSONDecoder().decode([UserMood].self, from: savedItems) {
                ratings = decodedItems
                return
            }
        }

        ratings = []
    }
    
}
