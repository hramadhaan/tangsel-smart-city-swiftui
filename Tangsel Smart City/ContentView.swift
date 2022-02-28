//
//  ContentView.swift
//  Tangsel Smart City
//
//  Created by Hanif Ramadhan Abdillah on 28/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var isAuthenticated = AppManager.isAuthenticated()
    
    @StateObject private var authVM = AuthViewModel()
    
    init() {
        authVM.autoLogin()
    }
    
    var body: some View {
        Group {
            isAuthenticated ? AnyView(HomeScreen()) : AnyView(LoginScreen())
        }
        .onReceive(AppManager.authenticated, perform: {
            isAuthenticated = $0
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
