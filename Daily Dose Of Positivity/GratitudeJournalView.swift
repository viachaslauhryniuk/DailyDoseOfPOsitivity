//
//  GratitudeJournalView.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct GratitudeJournalView: View {
    @EnvironmentObject var vm : UsersViewModel
    @FocusState var isFocused: Bool
    var body: some View {
        VStack {
            if vm.editText {
               Spacer()
                Form {
                    Section(header: Text("Write down what you're grateful for today").lineLimit(1)) {
                        TextEditor(text: $vm.editedText)
                            .background(Color.gray.opacity(0.10))
                            .cornerRadius(20)
                            .focused($isFocused)
                    }
                }
                .listRowSeparator(.hidden)
                .scrollContentBackground(.hidden)
            } else {
                Spacer()
                // Display Text if editText is false
                Text(vm.savedText.isEmpty ? "Add something" : vm.savedText)
                    .padding()
                    .background(.ultraThinMaterial)
                    .font(.body)
                    .fontWeight(.heavy)
                    .cornerRadius(25)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Button {
                if vm.editText {
                    // Save edited text and hide TextEditor
                    vm.savedText = vm.editedText
                }
                vm.editText.toggle()
                isFocused = vm.editText // Focus on TextEditor if editText is true
            } label: {
                Label(vm.editText ? "Save" : "Edit", systemImage: vm.editText ? "square.and.arrow.down" : "pencil")
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .padding(.vertical, 25)

        
        }
        .onAppear {
            vm.checkDailyAccessForGratitude()
            vm.editText = false
            vm.editedText = vm.savedText
        }
    }
    }


struct GratitudeJournalView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeJournalView()
    }
}
