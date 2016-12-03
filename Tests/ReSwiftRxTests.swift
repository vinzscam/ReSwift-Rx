//
//  ReSwiftRxTests.swift
//  ReSwiftRx
//
//  Created by Vincenzo Scamporlino on 2016-11-04.
//  Copyright © 2016 Vincenzo Scamporlino. All rights reserved.
//

import UIKit
import XCTest
import ReSwiftRx
import ReSwift
import RxSwift

//Example taken from: https://github.com/ReSwift/ReSwift#about-reswift

struct AppState: StateType{
    var counter: Int = 0
}

struct CounterActionIncrease: Action {}
struct CounterActionDecrease: Action {}

struct CounterReducer: Reducer {

    func handleAction(action: Action, state: AppState?) -> AppState {
        var state = state ?? AppState()

        switch action {
        case _ as CounterActionIncrease:
            state.counter += 1
        case _ as CounterActionDecrease:
            state.counter -= 1
        default:
            break
        }

        return state
    }

}

class ReSwiftRxTests: XCTestCase{

    var mainStore : Store<AppState>?
    var disposable : Disposable?

    override func setUp() {
        super.setUp()
        self.mainStore = Store<AppState>(
            reducer: CounterReducer(),
            state: nil
        )
    }

    override func tearDown() {
        super.tearDown()
        self.disposable?.dispose()
        self.disposable = nil
        self.mainStore = nil
    }

    func testAsObservableSubscribe() {
        let counterLimit = 10;
        let attempts = 15
        let expectationsTimeout = TimeInterval(10)

        let exp = expectation(description: "Wait until one or more events are received.")
        self.disposable = mainStore?.asObservable()
            .filter{ AppState -> Bool in
                AppState.counter > counterLimit
            }
            .take(1)
            .subscribe(onNext: { state in
                XCTAssertGreaterThan(state.counter, counterLimit, "counter must be greater than \(counterLimit)")
                exp.fulfill()
            });


        for _ in 1...attempts {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(arc4random() % 3)) { [weak self] in
                self?.mainStore?.dispatch(CounterActionIncrease())
            }
        }

        waitForExpectations(timeout: expectationsTimeout)
    }
}
