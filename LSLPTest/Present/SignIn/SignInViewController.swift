//
//  TestViewController.swift
//  LSLPTest
//
//  Created by 최서경 on 4/11/24.
//

import UIKit
import RxSwift
import RxCocoa

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
    }
    @objc func signUpButtonClicked() {
        print(#function)
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
