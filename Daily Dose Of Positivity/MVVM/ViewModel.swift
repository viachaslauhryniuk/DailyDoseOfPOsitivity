//
//  ViewModel.swift
//  Daily Dose Of Positivity
//
//  Created by Слава Гринюк on 30.12.23.
//
import SwiftUI
import Foundation
final class UsersViewModel: ObservableObject{
    @Published var quotes = [Quote]() // array of quotes
    @Published var acts = [Act]() // array of kindness acts
    @Published var ratings = [UserMood](){ // array of users mood
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(ratings){
                UserDefaults.standard.set(encoded, forKey: "MoodHistory")
            }
            
        }
    }
    @Published var users = [User](){
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(users){
                UserDefaults.standard.set(encoded, forKey: "Users")
            }
            
        }
    }
    @Published var isRegistered = true
    @Published var showLogRegView = false
    @Published var nextView: ViewStack = .login
    @Published var isLoading = false
    @Published var isLoggedIn = false
    @Published var userName = ""
    @Published var password = ""
    @Published var askDailyMood = false //special block for emojiratingview
    @AppStorage("Text") var savedText = ""
    @Published var editText = false
    @Published var editedText = ""
    
    
    
    
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "MoodHistory"),
           let decodedItems = try? JSONDecoder().decode([UserMood].self, from: savedItems) {
            self.ratings = decodedItems
        } else {
            self.ratings = []
        } //decoding users moods
        if let savedItems = UserDefaults.standard.data(forKey: "Users"),
           let decodedItems = try? JSONDecoder().decode([User].self, from: savedItems) {
            self.users = decodedItems
        } else {
            self.users = []
        }
        if let quotesData = loadDataFromJSONFile(named: "Data", as: [Quote].self),
           let actsData = loadDataFromJSONFile(named: "Acts", as: [Act].self) {
            self.quotes = quotesData
            self.acts = actsData
        } //decoding quotes and acts using function below
        else {
            fatalError("Failed to load quotes or acts from JSON.")
        }
    }
    
    
    
    
    
    private func loadDataFromJSONFile<T: Decodable>(named fileName: String, as type: T.Type) -> T? {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
            fatalError("Failed to locate \(fileName) in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            print("Error loading \(fileName) from JSON: \(error)")
            return nil
        }
    }
    
    
    
    func calculateAverageScore() -> Double {
        let totalScore = self.ratings.reduce(0) { $0 + $1.score }
        return Double(totalScore) / Double(self.ratings.count)
    }
    
    
    func checkDailyAccessForMood(Key: String) {
        
        let lastAccessDate = UserDefaults.standard.object(forKey: Key) as? Date
        
        if let lastAccessDate = lastAccessDate {
            if !Calendar.current.isDateInToday(lastAccessDate) {
                self.askDailyMood = true
                UserDefaults.standard.set(Date(), forKey: Key)
                
            }
        } else {
            self.askDailyMood = true
            
            UserDefaults.standard.set(Date(), forKey: Key)
            
        }
    }
    func checkDailyAccessForGratitude() {
        
        let lastAccessDate = UserDefaults.standard.object(forKey: "LastAccessDate") as? Date
        
        if let lastAccessDate = lastAccessDate {
            if !Calendar.current.isDateInToday(lastAccessDate) {
                savedText = ""
                UserDefaults.standard.set(Date(), forKey: "LastAccessDate")
                
            }
        } else {
            savedText = ""
            
            UserDefaults.standard.set(Date(), forKey: "LastAccessDate")
            
        }
    }
    func register(){
        let newUser = User(username: self.userName, password: self.password)
        self.users.append(newUser)
        self.isRegistered = true
        print(users)
    }
    func login(){
        if users.first(where: { $0.username == userName && $0.password == password }) != nil {
            isLoggedIn = true
           
        }
        else{
            print(users)
        }
    }
}
