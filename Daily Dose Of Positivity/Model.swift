//
//  Model.swift
//  Daily Dose Of Positivity
//
//  Created by Слава Гринюк on 30.12.23.
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
struct Act: Codable, Identifiable{
    let id: UUID
    let name: String
    let symbol: String
    var isPinned:Bool
}
struct Quote: Codable, Identifiable{
    let id: UUID
    let phrase: String
}
