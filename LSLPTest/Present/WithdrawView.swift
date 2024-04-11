//
//  SignUpView.swift
//  LSLPTest
//
//  Created by 최서경 on 4/12/24.
//

import UIKit

class WithdrawView: UIView {

    let withdrawButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.setTitleColor(.white, for: .normal)
        view.setTitle("탈퇴하기", for: .normal)
        return view
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
        configureView()
    }
    
    func configureHierarchy() {
        [withdrawButton].forEach {
            addSubview($0)
        }
    }
    func configureLayout() {
        withdrawButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(10)
            make.height.equalTo(45)
        }

    }
    func configureView() {
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
