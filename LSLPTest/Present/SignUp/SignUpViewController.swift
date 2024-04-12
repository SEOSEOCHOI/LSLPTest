//
//  SignUpViewController.swift
//  LSLPTest
//
//  Created by 최서경 on 4/11/24.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class SignUpViewController: UIViewController {
    let mainView = SignUpView()
    override func loadView() {
        self.view = mainView
    }
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.signUpButton.addTarget(self, action: #selector(self.signUpButtonClicked), for: .touchUpInside)
        
    }
    @objc func signUpButtonClicked() {
        let url = URL(string: APIKey.baseURL.rawValue + "/v1/users/join")!
        
        let header: HTTPHeaders = [
            HTTPHeader.contentType.rawValue : HTTPHeader.json.rawValue,
            HTTPHeader.sesacKey.rawValue : APIKey.sesacKey.rawValue
        ]
        
        let parameters: Parameters = [
            "email":mainView.emailTextField.text!,
            "password":mainView.passwordTextField.text!,
            "nick":mainView.nicknameTextField.text!
        ]
        AF.request(url,
                   method: .post,
                   parameters: parameters,
        encoding: JSONEncoding(),
                   headers: header)
        .validate(statusCode: 200..<400)
        .responseDecodable(of: JoinModel.self) { response in
            
            switch response.result  {
            case .success(let value):
                print("네트워크 요청 성공: \(value)")
                self.navigationController?.present(CompletedSignUpViewController(), animated: true)

            case .failure(_):
                if let code = response.response?.statusCode {
                    if code == 400 {
                        self.mainView.validateText.text = "빈칸을 입력해 주세요"
                    } else if code == 409 {
                        self.mainView.validateText.text = "이미 가입한 회원입니다."
                    }
                }
            }
        }
    }
    
}
