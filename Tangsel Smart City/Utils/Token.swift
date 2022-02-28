//
//  Token.swift
//  Tangsel Smart City
//
//  Created by Hanif Ramadhan Abdillah on 28/02/2022.
//

import Foundation

class Token: ObservableObject {
    func getToken() -> String {
        guard let token = UserDefaults.standard.string(forKey: "access_token") else {
            return ""
        }
        
        return token
    }
}
