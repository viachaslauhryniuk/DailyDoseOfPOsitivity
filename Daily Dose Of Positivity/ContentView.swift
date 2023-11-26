//
//  ContentView.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var ratings = Ratings()
    
    var body: some View {
       
        TabView {
            DailyQuoteView()
                .tabItem {
                    Label("Daily quote", systemImage: "newspaper")
                }
            GratitudeJournalView()
                .tabItem {
                    Label("Gratitude", systemImage: "pencil")
                }
            RandomActsGenerator()
                .tabItem {
                    Label("Kindness", systemImage: "heart.fill")
                }
            MoodTracker().environmentObject(ratings)
                .tabItem {
                    Label("Mood", systemImage: "bolt")
                }
            MyProfileView()
                .tabItem {
                    Label("My profile", systemImage: "person.crop.circle")
                }
        }
        .padding(.horizontal)
        .onAppear() {
                      let standardAppearance = UITabBarAppearance()
                      standardAppearance.backgroundColor = UIColor(Color.gray)
                      let itemAppearance = UITabBarItemAppearance()
                      itemAppearance.normal.iconColor = UIColor(Color.gray)
                      itemAppearance.selected.iconColor = UIColor(Color.red)
                      standardAppearance.inlineLayoutAppearance = itemAppearance
                      standardAppearance.stackedLayoutAppearance = itemAppearance
                      standardAppearance.compactInlineLayoutAppearance = itemAppearance
                      UITabBar.appearance().standardAppearance = standardAppearance
                  }
        .accentColor(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
