//
//  PrivateVariable.swift
//  SublimateClient
//
//  Created by i335287 on 07/11/2018.
//  Copyright © 2018 Gabriele. All rights reserved.
//


// GP TODO: We need to get rid of Variable, they are deprecated

import Foundation
import RxSwift
import RxCocoa

public final class ReadOnlyVariable<T> {
    private var relay: Variable<T>
    public var value: T {
        return relay.value
    }

    public init(of relay: Variable<T>) {
        self.relay = relay
    }

    public func asObservable() -> Observable<T> {
        return relay.asObservable()
    }
}

public extension Variable {
    public func asReadOnly() -> ReadOnlyVariable<Element> {
        return ReadOnlyVariable(of: self)
    }
}
