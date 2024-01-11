//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Слава Гринюк on 2.11.23.
//

import SwiftUI

struct EmojiRatingView: View {
    @EnvironmentObject var vm : UsersViewModel
    @Environment (\.dismiss) var dismiss
    var body: some View {
        VStack{
            Text("How do you feel today?")
            HStack{
                
                Button {
                    vm.ratings.append(.verysad)
                    dismiss()
                    
                } label: {
                    Text("😡")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    vm.ratings.append(.sad)
                    dismiss()
                } label: {
                    Text("😕")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    vm.ratings.append(.neutral)
                    dismiss()
                    
                } label: {
                    Text("😐")
                        .padding()
                        .scaleEffect(2)
                }
                Button{
                    vm.ratings.append(.happy)
                    dismiss()
                    
                } label: {
                    Text("🙂")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    vm.ratings.append(.glowing)
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
