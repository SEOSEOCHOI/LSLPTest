//
//  NetworkManager.swift
//  LSLPTest
//
//  Created by 최서경 on 4/11/24.
//

import Foundation
import RxSwift
import Alamofire
struct NetworkManager {
    
    // LoginQuery에 이메일과 페스워드가 담겨 있다.
    static func createLogin(query: LoginQuery) -> Single<LoginModel> {
        return Single<LoginModel>.create { single in
            do {
                let urlRequest = try Router.login(query: query).asURLRequest()
                                
                AF.request(urlRequest)
                    .validate(statusCode: 200..<300)
                    .responseDecodable(of: LoginModel.self) { response in
                        switch response.result {
                        case .success(let loginModel):
                            single(.success(loginModel))
                        case .failure(let error):
                            single(.failure(error))
                        }
                    }
            } catch {
                single(.failure(error))
            }
            
            return Disposables.create()
        }
    }
}

