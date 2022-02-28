//
//  AuthModel.swift
//  Tangsel Smart City
//
//  Created by Hanif Ramadhan Abdillah on 28/02/2022.
//

import Foundation

struct AuthKelurahanData: Decodable {
    var _id: String?
    var kelurahan: String?
}


struct AuthUserData: Decodable {
    var _id: String?
    var nama: String?
    var email: String?
    var phone: String?
    var kelurahan: AuthKelurahanData?
    var post: [String]?
    var followers: [RelationData]?
    var followings: [RelationData]?
    var avatar: String?
}

struct AuthResponse: Decodable {
    var success: Bool?
    var message: String?
    var token: String?
    var user: AuthUserData?
}
