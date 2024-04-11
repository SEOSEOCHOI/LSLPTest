//
//  Router.swift
//  LSLPTest
//
//  Created by 최서경 on 4/11/24.
//

import Foundation
import Alamofire

enum Router {
    case login(query: LoginQuery)
}

extension Router: TargetType {
    var baseURL: String {
        return APIKey.baseURL.rawValue
    }
    
    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "v1/users/login"
        }
    }
    
    var header: [String : String] {
        switch self {
        case .login:
            return [HTTPHeader.contentType.rawValue:HTTPHeader.json.rawValue,
                    HTTPHeader.sesacKey.rawValue:APIKey.sesacKey.rawValue]
        }
    }
    
    var parameters: String? {
        return nil
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var body: Data? {
        switch self {
        case .login(let query):
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            return try? encoder.encode(query)
        }
    }
    
    
}
