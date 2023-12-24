//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Слава Гринюк on 2.11.23.
//

import SwiftUI

struct EmojiRatingView: View {
    @EnvironmentObject var ratings: Ratings
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("How do you feel today?")
            HStack{
                
                Button {
                    ratings.ratings.append(.verysad)
                    dismiss()
                    
                } label: {
                    Text("😡")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    ratings.ratings.append(.sad)
                    dismiss()
                    
                } label: {
                    Text("😕")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    ratings.ratings.append(.neutral)
                    dismiss()
                    
                } label: {
                    Text("😐")
                        .padding()
                        .scaleEffect(2)
                }
                Button{
                    ratings.ratings.append(.happy)
                    dismiss()
                    
                } label: {
                    Text("🙂")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    ratings.ratings.append(.glowing)
                    dismiss()
                    
                } label: {
                    Text("🥳")
                        .padding()
                        .scaleEffect(2)
                }
                
                
                
                
                
            }
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView()
    }
}
