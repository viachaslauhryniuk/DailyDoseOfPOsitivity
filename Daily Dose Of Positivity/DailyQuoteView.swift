//
//  DailyQuoteView.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct DailyQuoteView: View {
    @EnvironmentObject var vm : UsersViewModel
    var body: some View {
        VStack{
                Text(vm.quotes.randomElement()?.phrase ?? "nil")
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
