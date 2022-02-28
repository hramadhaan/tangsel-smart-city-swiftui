//
//  HomeScreen.swift
//  Tangsel Smart City
//
//  Created by Hanif Ramadhan Abdillah on 28/02/2022.
//

import SwiftUI

struct HomeScreen: View {
    
    private var AuthVM = AuthViewModel()
    
    var body: some View {
        VStack {
            Text("Home Screen")
            Button(action: {
                AuthVM.logout()
            }, label: {
                Text("Logout")
            }).buttonStyle(DefaultButtonStyle()).padding(.top)
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
