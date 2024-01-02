//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Слава Гринюк on 2.11.23.
//

import SwiftUI

struct EmojiRatingView: View {
    @EnvironmentObject var vm : UsersViewModel
    var body: some View {
        VStack{
            Text("How do you feel today?")
            HStack{
                
                Button {
                    vm.ratings.append(.verysad)
                    vm.dismiss()
                    
                } label: {
                    Text("😡")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    vm.ratings.append(.sad)
                    vm.dismiss()
                    
                } label: {
                    Text("😕")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    vm.ratings.append(.neutral)


                    vm.dismiss()
                    
                } label: {
                    Text("😐")
                        .padding()
                        .scaleEffect(2)
                }
                Button{
                    vm.ratings.append(.happy)

                    vm.dismiss()
                    
                } label: {
                    Text("🙂")
                        .padding()
                        .scaleEffect(2)
                }
                Button {
                    vm.ratings.append(.glowing)
             

                    vm.dismiss()
                    
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
