//
//  LoginView.swift
//  Daily Dose Of Positivity
//
//  Created by Слава Гринюк on 4.01.24.
//

import SwiftUI
import Pow
struct LoginView: View {
    @ObservedObject var vm = UsersViewModel()
    @Environment (\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            VStack{
                if vm.isLoggedIn{
                    MainMenu().transition(
                        AnyTransition.asymmetric(
                            insertion: AnyTransition.opacity.animation(Animation.easeInOut.delay(1)),
                            removal: AnyTransition.opacity)
                    )
                }
                else{
                    Text("Welcome back!")
                        .foregroundStyle(.red)
                        .font(.system(size: 30, weight: .bold))
                        .padding(.bottom,25)
                    Group{
                       
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
                    HStack{
                        Toggle( "Stay logged in", isOn: $vm.isRegistered)
                            .toggleStyle(CheckboxStyle())
                            .padding()
                        Spacer()
                    }
                    Button(role: .destructive){
                        vm.login()
                    } label: {
                        Text("Sign in")
                            .font(.system(size: 22 , weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 220, height: 60)
                    .background(Color(.red))
                    .clipShape(.rect(cornerRadius: 15))
                    .conditionalEffect(.repeat(.shine(duration: 2), every: (.seconds(6))), condition: vm.isRegistered)
                }
          
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
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
