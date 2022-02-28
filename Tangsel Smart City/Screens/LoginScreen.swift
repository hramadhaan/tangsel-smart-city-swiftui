//
//  LoginScreen.swift
//  Tangsel Smart City
//
//  Created by Hanif Ramadhan Abdillah on 28/02/2022.
//

import SwiftUI

struct LoginScreen: View {
    
    @StateObject private var authVM = AuthViewModel()
    
    var body: some View {
        VStack() {
            Form {
                TextField("Masukkan Email", text: $authVM.emailLogin)
                    .textFieldStyle(RoundedBorderTextFieldStyle()).padding(.vertical)
                SecureField("Masukkan Password", text: $authVM.passwordLogin).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                Button(action: {
                    print("Login Cek")
                    authVM.login()
                }, label: {
                    Text("Login")
                })
                authVM.message != "" ? Text("Error: \(authVM.message)").foregroundColor(Color.red) : nil
            }
           
        }.padding(.horizontal)
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
    }
}
