//
//  SignInVIewModel.swift
//  LSLPTest
//
//  Created by 최서경 on 4/11/24.
//

import Foundation
import RxSwift
import RxCocoa

class SignInViewModel: ViewModelType {
    var disposeBag = DisposeBag()
    
    struct Input {
        let emailText: Observable<String>
        let passwordText: Observable<String>
        let signInTap: Observable<Void>
        let signUpTap: Observable<Void>
        
    }
    struct Output {
        let loginValidation: Driver<Bool>
        let loginSuccessTrigger: Driver<Void>
        let signUpTrigger: Driver<Void>
    }
    
    func transform(input: Input) -> Output {
        let loginObservable = Observable.zip(input.emailText, input.passwordText)
            .map { email, password in
                return LoginQuery(email: email, password: password)
            }
        
        let loginValid = BehaviorRelay(value: false)
        let loginSuccessTrigger = PublishRelay<Void>()
        let signUpTrigger = PublishRelay<Void>()
        
        loginObservable
            .bind(with: self) { owner, login in
                if login.email.contains("@") && login.password.count > 5 {
                    loginValid.accept(true)
                } else {
                    loginValid.accept(false)
                }
            }
            .disposed(by: disposeBag)
        
        input.signInTap
            .debounce(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(loginObservable)
            .flatMap {
                return NetworkManager.createLogin(query: $0)
            }
            .subscribe(with: self) { owner, login in
                loginSuccessTrigger.accept(())
            } onError: { owner, error in
                print("오류 발생")
            }
            .disposed(by: disposeBag)

        
        return Output(loginValidation: loginValid.asDriver(),
                      loginSuccessTrigger: loginSuccessTrigger.asDriver(onErrorJustReturn:()),
                      signUpTrigger: signUpTrigger.asDriver(onErrorJustReturn: ()))
    }
    
}
