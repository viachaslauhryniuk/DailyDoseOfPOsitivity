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
       
                VStack {
                    Text("Mood Analysis")
                        .font(.title)
                        .padding()
                    
                    Text("User's Moods:")
                        .font(.headline)
                        .padding()
                    
                    ScrollView {
                        VStack(spacing: 10) {
                            ForEach(ratings.ratings, id: \.self) { mood in
                                Text(mood.rawValue)
                                    .padding()
                            }
                        }
                    }
                    
                    Text("Mood Score Average: \(calculateAverageScore())")
                        .font(.headline)
                        .padding()
                    Text(calculateAverageScore() > 4.0 ? "Embrace this joyous moment! Let your happiness fuel your day, spread positivity, and cherish the little things that bring you smiles." : calculateAverageScore() > 2.0 ? "Life has its ebbs and flows. In this neutrality lies the canvas for possibilities. Take a moment to reflect, find balance, and explore the potential in the ordinary." : "Remember, tough days don't define you. Take a deep breath, seek solace in small comforts, and know that brighter days are just around the corner.")
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
            
        
      
       
        
    
    
    
    
    func calculateAverageScore() -> Double {
        let totalScore = ratings.ratings.reduce(0) { $0 + $1.score }
        return Double(totalScore) / Double(ratings.ratings.count)
    }

    
    func checkDailyAccess() {
        
        let lastAccessDate = UserDefaults.standard.object(forKey: "LastAccessDat") as? Date
        
        if let lastAccessDate = lastAccessDate {
            if !Calendar.current.isDateInToday(lastAccessDate) {
                showBlock = true
                UserDefaults.standard.set(Date(), forKey: "LastAccessDat")
                
            }
        } else {
            showBlock = true
            
            UserDefaults.standard.set(Date(), forKey: "LastAccessDat")
            
        }
    }
    
}

struct MoodTracker_Previews: PreviewProvider {
    static var previews: some View {
        MoodTracker()
    }
}
