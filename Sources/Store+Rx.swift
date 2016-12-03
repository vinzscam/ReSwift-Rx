//
//  Store+Rx.swift
//  ReSwiftRx
//
//  Created by Vincenzo Scamporlino on 2016-11-04.
//  Copyright © 2016 Vincenzo Scamporlino. All rights reserved.
//

import Foundation
import ReSwift
import RxSwift


extension Store {

    @available(*, unavailable, renamed: "asObservable")
    open func createObservable() -> Observable<State> {
        return asObservable()
    }

    open func asObservable() -> Observable<State> {
        return Observable.create{ [weak self] observer in
            
            let storeSubscriber = RxStoreSubscriber<State>(observer: observer)

            self?.subscribe(storeSubscriber)
            return Disposables.create { [weak self] in
                self?.unsubscribe(storeSubscriber)
            }
        }
    }
}

fileprivate class RxStoreSubscriber<State> : StoreSubscriber {
    typealias StoreSubscriberStateType = State
    let observer: AnyObserver<State>
    
    init(observer: AnyObserver<State>) {
        self.observer = observer
    }
    
    func newState(state: State) {
        self.observer.onNext(state)
    }
}
