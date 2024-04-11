//
//  LoginModel.swift
//  LSLPTest
//
//  Created by 최서경 on 4/11/24.
//

import Foundation
struct LoginModel: Decodable {
    let accessToken: String
    let refreshToken: String
}
