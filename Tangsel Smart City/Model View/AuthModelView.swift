//
//  AuthModelView.swift
//  Tangsel Smart City
//
//  Created by Hanif Ramadhan Abdillah on 28/02/2022.
//

import Foundation
import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    
    var emailLogin: String = ""
    var passwordLogin: String = ""
    
    private var authService: AuthService!
    @Published var authResponse = AuthResponse()
    @Published var isAuthenticated: Bool = false
    
    @Published var message: String = ""
    
    init() {
        self.authService = AuthService()
    }
    
    func login() {
        let defaults = UserDefaults.standard
        
        self.authService.login(email: emailLogin, password: passwordLogin) { (result) in
            
            switch result {
            case .success(let authData):
                defaults.setValue(authData.token, forKey: "access_token")
                print("MV: \(authData)")
                if (authData.token != nil) {
                    DispatchQueue.main.async {
                        self.authResponse = authData
                        self.isAuthenticated = true
                        AppManager.authenticated.send(true)
                    }
                } else {
                    self.message = authData.message ?? "Terjadi Kesalahan Koneksi"
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
            
            
        }
    }
    
    func autoLogin() {
        guard let token = UserDefaults.standard.string(forKey: "access_token") else {
            return
        }
        
        if (token != "") {
            DispatchQueue.main.async {
                self.isAuthenticated = true
                AppManager.authenticated.send(true)
            }
        } else {
            DispatchQueue.main.async {
                self.isAuthenticated = false
                AppManager.authenticated.send(false)
            }
        }
    }
    
    func logout() {
        let defaults = UserDefaults.standard
        
        DispatchQueue.main.async {
            defaults.removeObject(forKey: "access_token")
            self.isAuthenticated = false
            AppManager.authenticated.send(false)
        }
    }
}
