//
//  MoodTracker.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct MoodTracker: View {
    @EnvironmentObject var vm : UsersViewModel
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
                            ForEach(vm.ratings.reversed(), id: \.self) { mood in
                                Text(mood.rawValue)
                                    .padding()
                            }
                        }
                    }
                    Text("Mood Score Average: \(vm.ratings.isEmpty ? "Not enough data" : String(vm.calculateAverageScore()))")
                        .font(.headline)
                        .padding()
                    Divider()
                    Text(vm.calculateAverageScore() > 4.0 ? "Embrace this joyous moment! Let your happiness fuel your day, spread positivity, and cherish the little things that bring you smiles." : vm.calculateAverageScore() > 2.0 ? "Life has its ebbs and flows. In this neutrality lies the canvas for possibilities. Take a moment to reflect, find balance, and explore the potential in the ordinary." : "Remember, tough days don't define you. Take a deep breath, seek solace in small comforts, and know that brighter days are just around the corner.")
                        .padding(.bottom)
                }
                .onAppear {
                    vm.checkDailyAccessForMood(Key: "Mood")
                }
                .sheet(isPresented: $vm.askDailyMood) {
                    EmojiRatingView()
                        .presentationDetents([.fraction(0.15)])
                    
                }
            }
}

struct MoodTracker_Previews: PreviewProvider {
    static var previews: some View {
        MoodTracker()
    }
}
