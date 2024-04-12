//
//  SignUpView.swift
//  LSLPTest
//
//  Created by 최서경 on 4/12/24.
//

import UIKit

class SignUpView: UIView {
    /*
     이메일, 비밀번호, 로그인, 회원가입
     */
    let emailTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "이메일을 입력해 주세요."
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        return view
    }()
    let passwordTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "이메일을 입력해 주세요."
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        return view
    }()
    let nicknameTextField: UITextField = {
        let view = UITextField()
        view.placeholder = "닉네임을 입력해 주세요."
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 8
        return view
    }()
    let signUpButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.setTitleColor(.white, for: .normal)
        view.setTitle("회원가입", for: .normal)
        return view
    }()
    let validateText: UILabel = {
       let view = UILabel()
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        [emailTextField, passwordTextField, nicknameTextField, signUpButton, validateText].forEach {
            addSubview($0)
        }
    }
    func configureLayout() {
        emailTextField.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(45)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(45)
        }
        nicknameTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(nicknameTextField.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        validateText.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
    }
    func configureView() {
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
