//
//  RandomActsGenerator.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct RandomActsGenerator: View {
    @StateObject var acts = Acts()
    var body: some View {
        NavigationStack{
            List{
                ForEach(acts.acts.shuffled(), id: \.id){ act in
                    Label(act.name, systemImage: act.symbol)
                        .listRowBackground(
                            RoundedRectangle(cornerRadius: 10)
                                .background(.clear)
                                .foregroundColor(Color.gray.opacity(0.1))
                                .padding(
                                    EdgeInsets(
                                        top: 2,
                                        leading: 1,
                                        bottom: 2,
                                        trailing: 1
                                    )
                                )
                        )
                        .listRowSeparator(.hidden)
                        }
                }
            .navigationTitle("Random acts of kindness")
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            }
            
           
            
        }
    }

struct RandomActsGenerator_Previews: PreviewProvider {
    static var previews: some View {
        RandomActsGenerator()
    }
}
