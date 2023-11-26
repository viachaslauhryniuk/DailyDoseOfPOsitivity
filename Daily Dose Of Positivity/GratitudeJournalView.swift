//
//  GratitudeJournalView.swift
//  Grocery Price Tracker
//
//  Created by Слава Гринюк on 12.11.23.
//

import SwiftUI

struct GratitudeJournalView: View {
    @AppStorage("Text") var savedText = ""
    @State var editText = false
    @State var editedText = ""
    @FocusState var isFocused: Bool

    var body: some View {
        VStack {
            if editText {
               Spacer()
                Form {
                    Section(header: Text("Write down what you're grateful for today").lineLimit(1)) {
                        TextEditor(text: $editedText)
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
                Text(savedText)
                    .padding()
                    .background(.ultraThinMaterial)
                    .font(.body)
                    .fontWeight(.heavy)
                    .cornerRadius(25)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Button {
                if editText {
                    // Save edited text and hide TextEditor
                    savedText = editedText
                }
                editText.toggle()
                isFocused = editText // Focus on TextEditor if editText is true
            } label: {
                Label(editText ? "Save" : "Edit", systemImage: editText ? "square.and.arrow.down" : "pencil")
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .padding(.vertical, 25)

        
        }
        .onAppear {
            checkDailyAccess()
            editText = false
            editedText = savedText
        }
    }

    func checkDailyAccess() {
        
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
    }


struct GratitudeJournalView_Previews: PreviewProvider {
    static var previews: some View {
        GratitudeJournalView()
    }
}
