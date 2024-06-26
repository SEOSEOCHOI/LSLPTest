//
//  ViewModelType.swift
//  LSLPTest
//
//  Created by 최서경 on 4/11/24.
//

import Foundation
import RxSwift
protocol ViewModelType {
    associatedtype Input
    associatedtype Output

    var disposeBag: DisposeBag { get set }
    
    func transform(input: Input) -> Output
}
