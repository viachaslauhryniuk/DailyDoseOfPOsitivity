//
//  RandomActsGenerator.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//
import SwiftUI
struct RandomActsGenerator: View {
    @EnvironmentObject var vm : UsersViewModel
    var body: some View {
        NavigationStack{
            ForEach($vm.acts.filter({ $act in act.isPinned == true })) { $act in
                Label(act.name, systemImage: "pin.slash.fill")
                    .padding()
                    .onTapGesture {
                        act.isPinned = false
                    }
                    .lineLimit(1)
            }
            Divider()
            Section{
                List{
                    ForEach($vm.acts.shuffled().filter({ $act in act.isPinned == false }), id: \.id){ $act in
                        Label(act.name, systemImage: act.symbol)
                            .swipeActions(edge: .leading) {
                                Button {
                                    act.isPinned.toggle()
                                } label: {
                                    Label("Pin", systemImage: !act.isPinned ? "pin.fill" : "pin.slash.fill")
                                }
                                .tint(Color.orange)
                                
                            }
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
