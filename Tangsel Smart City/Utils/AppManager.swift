//
//  AppManager.swift
//  Tangsel Smart City
//
//  Created by Hanif Ramadhan Abdillah on 28/02/2022.
//

import Foundation
import Combine

struct AppManager {
    static let authenticated = PassthroughSubject<Bool, Never>()
    
    static func isAuthenticated() -> Bool {
        return UserDefaults.standard.string(forKey: "access_token") != nil
    }
}
