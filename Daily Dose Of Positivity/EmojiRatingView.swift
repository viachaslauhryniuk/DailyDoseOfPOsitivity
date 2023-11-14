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
                    ratings.ratings.append(1)
                    dismiss()
                    
                } label: {
                    Text("😡")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    ratings.ratings.append(2)
                    dismiss()
                    
                } label: {
                    Text("😕")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    ratings.ratings.append(3)
                    dismiss()
                    
                } label: {
                    Text("😐")
                        .padding()
                        .scaleEffect(2)
                }
                Button{
                    ratings.ratings.append(4)
                    dismiss()
                    
                } label: {
                    Text("🙂")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    ratings.ratings.append(5)
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
