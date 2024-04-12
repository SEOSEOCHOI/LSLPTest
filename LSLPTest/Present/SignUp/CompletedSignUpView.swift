//
//  SignUpView.swift
//  LSLPTest
//
//  Created by 최서경 on 4/12/24.
//

import UIKit

class CompletedSignUpView: UIView {
    /*
     이메일, 비밀번호, 로그인, 회원가입
     */

    let doneLabel: UILabel = {
       let view = UILabel()
        view.text = "가입이 완료되었습니다."
        return view
    }()
    
    let emailLabel: UILabel = {
        let view = UILabel()
         return view
     }()
    
    let backButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.setTitleColor(.white, for: .normal)
        view.setTitle("로그인하기", for: .normal)
        return view
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        [doneLabel, emailLabel, backButton].forEach {
            addSubview($0)
        }
    }
    func configureLayout() {

        doneLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(doneLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(40)
        }
        backButton.snp.makeConstraints { make in
            make.top.equalTo(doneLabel.snp.bottom).offset(10)
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
