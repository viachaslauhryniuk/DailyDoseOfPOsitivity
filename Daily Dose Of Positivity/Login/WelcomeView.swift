//
//  WelcomeView.swift
//  Daily Dose Of Positivity
//
//  Created by Слава Гринюк on 9.01.24.
//

import SwiftUI
import Pow
struct WelcomeView: View {
    @ObservedObject var vm = UsersViewModel()
  
    var body: some View {
        NavigationStack{
            VStack{
                
                Image("Logo2")
                    .resizable()
                    .scaledToFit()
                
                VStack{
                    Text("Make yourself").font(.system(size: 25, weight: .bold))
                    Text("Proud")
                        .font(.system(size: 32,weight: .bold))
                        .foregroundStyle(.red)
                        .padding(.bottom,35)
                    
                }
                
                HStack(spacing: 12){
                    Button {
                        vm.nextView = .login
                        vm.showLogRegView.toggle()
                    } label: {
                        Text("Login")
                            .font(.system(size: 22 , weight: .semibold))
                            .foregroundStyle(.white)
                    }
                    .frame(width: 160, height: 60)
                    .background(Color(.red))
                    .clipShape(.rect(cornerRadius: 15))
                    
                   
                    
                    Button {
                        vm.nextView = .registration
                        vm.showLogRegView.toggle()
                    } label: {
                        Text("Register")
                            .font(.system(size: 22 , weight: .semibold))
                            .foregroundStyle(.black)
                    }
                    .frame(width: 160, height: 60)
                    .background(Color(.white))
                    .clipShape(.rect(cornerRadius: 15))
                    
                }
                
            }
           
            .navigationDestination(isPresented: $vm.showLogRegView) {
                switch vm.nextView {
                case .login:
                    LoginView()
                case .registration:
                    RegistrerView()
                }
                  
            }
            .navigationBarBackButtonHidden()
            
        }
        
    }
}

#Preview {
    WelcomeView()
}
