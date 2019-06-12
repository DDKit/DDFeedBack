//
//  ViewController.swift
//  DDFeedback
//
//  Created by DuanChangHe on 06/11/2019.
//  Copyright (c) 2019 DuanChangHe. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import DDFeedback

public struct TestState {
    var count: Int = 0
    
    enum Event {
        case add(Void)
        case cut(Void)
    }
    
    static func reduce(state: TestState, event: TestState.Event) -> TestState {
        var tempState: TestState = state
        switch event {
        case .add:
            tempState.count += 1
        case .cut:
            tempState.count -= 1
        }
        return tempState
    }
}

class ViewController: UIViewController {

    let bag =  DisposeBag()
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var showLabel: UILabel!
    
    @IBOutlet weak var cutBtn: UIButton!
    
    override func loadView() {
        super.loadView()
        DriverSystem<TestState,TestState.Event>
            .create(initialState: TestState(), reduce: TestState.reduce)
            .binded(self, { (me, state) in
                var subscriptions: [Disposable] = []
                var events: [Signal<TestState.Event>] = []
                subscriptions.append(state.map{$0.count}.map{"\($0)"}.drive(me.showLabel.rx.text) )
                events.append(me.addBtn.rx.tap.asSignal().map(TestState.Event.add))
                events.append(me.cutBtn.rx.tap.asSignal().map(TestState.Event.cut))
                return Bindings(subscriptions: subscriptions, events: events)
            })
            .run()
            .disposed(by: bag)
    }
}

