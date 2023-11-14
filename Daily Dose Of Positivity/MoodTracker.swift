//
//  MoodTracker.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct MoodTracker: View {
    @State private var showBlock = false
    @EnvironmentObject var ratings: Ratings
    var body: some View {
        
    
        VStack{
            ForEach(ratings.ratings, id: \.self){ rating in
                Text(String(rating))
            }
            
        }
        .onAppear {
            checkDailyAccess()
            
        }
        .sheet(isPresented: $showBlock) {
            EmojiRatingView()
                .environmentObject(ratings)
                .presentationDetents([.fraction(0.15)])
            
        }
        
    }
    
    
    
    
    
    func checkDailyAccess() {
        
        let lastAccessDate = UserDefaults.standard.object(forKey: "LastAccessDate") as? Date
        
        if let lastAccessDate = lastAccessDate {
            if !Calendar.current.isDateInToday(lastAccessDate) {
                showBlock = true
                UserDefaults.standard.set(Date(), forKey: "LastAccessDate")
                
            }
        } else {
            showBlock = true
            
            UserDefaults.standard.set(Date(), forKey: "LastAccessDate")
            
        }
    }
    
}

struct MoodTracker_Previews: PreviewProvider {
    static var previews: some View {
        MoodTracker()
    }
}
