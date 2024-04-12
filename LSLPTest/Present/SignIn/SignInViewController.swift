//
//  TestViewController.swift
//  LSLPTest
//
//  Created by 최서경 on 4/11/24.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire

class SignInViewController: UIViewController {
    let mainView = SignView()
    let viewModel = SignInViewModel()
    override func loadView() {
        self.view = mainView
    }
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.signInButton.addTarget(self, action: #selector(self.signInButtonClicked), for: .touchUpInside)
        mainView.signUpButton.addTarget(self, action: #selector(self.signUpButtonClicked), for: .touchUpInside)
        
    }
    @objc func signInButtonClicked() {
        print(#function)
        
        let url = URL(string: APIKey.baseURL.rawValue + "/v1/users/login")!
        
        let header: HTTPHeaders = [
            HTTPHeader.sesacKey.rawValue : APIKey.sesacKey.rawValue,
            HTTPHeader.contentType.rawValue : HTTPHeader.json.rawValue
        ]
        
        let parameter: Parameters = [
            "email":mainView.emailTextField.text!,
            "password":mainView.passwordTextField.text!
        ]
        
        AF.request(url,
                   method: .post,
                   parameters: parameter,
                   encoding: JSONEncoding(),
                   headers: header)
        .responseDecodable(of: LoginModel.self) { response in
            switch response.result {
            case .success(let value):
                print(url)
                UserDefaults.standard.set(value.refreshToken, forKey: "refreshToken")
                UserDefaults.standard.set(value.accessToken, forKey: "accessToken")
                self.navigationController?.pushViewController(WithdrawViewController(), animated: true)
            case.failure(_):
                if let code = response.response?.statusCode {
                    print(url)
                    print("로그인 실패: \(code)")
                    self.mainView.validateText.text = "로그인 실패 \(code)"
                } else {
                    self.mainView.validateText.text = "로그인 실패"
                }
            }
        }
    }
    @objc func signUpButtonClicked() {
        print(#function)
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}
    

//        
//        let output = viewModel.transform(input: input)
//        
//        output.loginValidation
//            .drive(with: self) { owner, valid in
//                let color: UIColor = valid ? .blue : .lightGray
//                let textColor: UIColor = valid ? .white : .darkGray
//                
//                owner.mainView.signInButton.setTitleColor(textColor, for: .normal)
//                owner.mainView.signInButton.backgroundColor = color
//                
//                owner.mainView.signInButton.isEnabled = valid
//            }
//            .disposed(by: disposeBag)
//        
//        output.loginSuccessTrigger
//            .drive(with: self) { owner, _ in
//                owner.navigationController?.pushViewController(ViewController(), animated: true)
//            }
//            .disposed(by: disposeBag)
//        
//        output.signUpTrigger
//            .drive(with: self) { owner, _ in
//                owner.navigationController?.pushViewController(SignUpViewController(), animated: true)
//            }
//            .disposed(by: disposeBag)
//        
//    }
//}
