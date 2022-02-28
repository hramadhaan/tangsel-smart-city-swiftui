//
//  AuthService.swift
//  Tangsel Smart City
//
//  Created by Hanif Ramadhan Abdillah on 28/02/2022.
//

import Foundation

enum AuthenticationError: Error {
    case invalidCredentials
    case custom(errorMessage: String)
}

struct LoginRequestBody: Codable {
    let email: String
    let password: String
}

class AuthService {
    func login(email: String, password: String, callback: @escaping (Result<AuthResponse, AuthenticationError>) -> Void) {
        
        guard let url = URL(string: "http://192.168.100.8:8000/auth/login") else {
            callback(.failure(.custom(errorMessage: "URL is not correct")))
            print("URL is not correct")
            return
        }
        
        print("Authentication: \(email) \(password)")
        
        let body = LoginRequestBody(email: email, password: password)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(body)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                callback(.failure(.custom(errorMessage: "No Data")))
                print("No Data")
                return
            }
            
            print("Data \(data)")
            
            guard let loginResponse = try? JSONDecoder().decode(AuthResponse.self, from: data) else {
                callback(.failure(.invalidCredentials))
                print("Invalid Credentials")
                return
            }
            
            callback(.success(loginResponse))
            print("Success")
            
        }.resume()
        
    }
}
