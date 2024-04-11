//
//  WithdrawViewController.swift
//  LSLPTest
//
//  Created by 최서경 on 4/12/24.
//

import UIKit
import Alamofire

class WithdrawViewController: UIViewController {
    let mainView = WithdrawView()
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        mainView.withdrawButton.addTarget(self, action: #selector(withdrawButtonTapped), for: .touchUpInside)
    }
    @objc func withdrawButtonTapped() {
        let url = URL(string: APIKey.baseURL.rawValue + "/v1/users/withdraw")!
        let headers: HTTPHeaders = [
            HTTPHeader.authorization.rawValue:UserDefaults.standard.string(forKey: "accessToken")!,
            HTTPHeader.sesacKey.rawValue:APIKey.sesacKey.rawValue
        ]
        AF.request(url,
                   method: .get
                   ,headers: headers).responseDecodable(of: WithdrawModel.self) { response in
            switch response.result {
            case .success(let withdraw):
                self.changeRootView(to: SignInViewController())
            case .failure(_):
                if let code = response.response?.statusCode {
                    print("탈퇴 불가: \(code)")
                }
                
            }
        }
    }
}
