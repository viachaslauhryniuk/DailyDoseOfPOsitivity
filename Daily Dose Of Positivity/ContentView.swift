//
//  ContentView.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = UsersViewModel()
    
    var body: some View {
       
        TabView {
            DailyQuoteView().environmentObject(vm)
                .tabItem {
                    Label("Daily quote", systemImage: "newspaper")
                }
            GratitudeJournalView().environmentObject(vm)
                .tabItem {
                    Label("Gratitude", systemImage: "pencil")
                }
            RandomActsGenerator().environmentObject(vm)
                .tabItem {
                    Label("Kindness", systemImage: "heart.fill")
                }
            MoodTracker().environmentObject(vm)
                .tabItem {
                    Label("Mood", systemImage: "bolt")
                }
            MyProfileView().environmentObject(vm)
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
