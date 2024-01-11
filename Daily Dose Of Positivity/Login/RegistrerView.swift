//
//  RegistrerView.swift
//  Daily Dose Of Positivity
//
//  Created by Слава Гринюк on 4.01.24.
//

import SwiftUI
import Pow
struct RegistrerView: View {
    @ObservedObject var vm = UsersViewModel()
    @Environment (\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack {
                Text("Join us now!")
                    .foregroundStyle(.red)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.bottom,25)
                Group{
                    TextField("First name", text: $vm.userName)
                    TextField("Username", text: $vm.userName)
                    SecureField("Password", text: $vm.password)
                }
                
                .padding()
                .clipShape(.rect(cornerRadius: 12))
                .background(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.red)
                    )
                .padding(.horizontal)
        
                Button(){
                    vm.register()
                    if vm.isRegistered{dismiss()}
                } label: {
                    Text("Create an account")
                        .font(.system(size: 22 , weight: .semibold))
                        .foregroundStyle(.white)
                }
                .frame(width: 220, height: 60)
                .background(Color(.red))
                .clipShape(.rect(cornerRadius: 15))
                .padding(.top)
                .conditionalEffect(.repeat(.shine(duration: 2), every: (.seconds(6))), condition: vm.isRegistered)
            
                
                   
            }
            .navigationBarBackButtonHidden()
            .toolbar {
                if !vm.isLoggedIn{
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundStyle(.red)
                        }
                    }
                }
            }
           
           
        }
    }
}
struct RegistrerView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrerView()
    }
}
