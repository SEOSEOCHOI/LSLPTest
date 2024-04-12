//
//  CompletedSignUpViewController.swift
//  LSLPTest
//
//  Created by 최서경 on 4/12/24.
//

import UIKit
import RxSwift
import Alamofire

class CompletedSignUpViewController: UIViewController {
    let mainView = CompletedSignUpView()
    override func loadView() {
        self.view = mainView
    }
    
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
    }
    @objc func backButtonClicked() {
        changeRootView(to: SignInViewController())
    }
}
