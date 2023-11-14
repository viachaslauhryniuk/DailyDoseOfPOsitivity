//
//  DailyQuoteView.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct DailyQuoteView: View {
    @ObservedObject private var quotes = Quotes()
    var body: some View {
        VStack{
                Text(quotes.quotes.randomElement()?.phrase ?? "nil")
                    .padding()
                    .background(.ultraThinMaterial)
                    .font(.title)
                    .fontWeight(.heavy)
                    .cornerRadius(25)
                    .foregroundColor(Color.gray)
            }
        }
    }


struct DailyQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        DailyQuoteView()
    }
}
