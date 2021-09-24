//
//  MainViewManager.swift
//  ObserverPattern
//
//  Created by yuhyeonjae on 2021/09/24.
//

import UIKit

// MARK:- ㄴ Observer
protocol MainObserver {
    var id: String { get set }
    func updateBackgroudColor(_ color: UIColor)
}

protocol MainPublisher {
    var observers: [MainObserver] { get set }
    func subscribe(observer: MainObserver)
    func unSubscribe(observer: MainObserver)
    func unSubscribeAll()
}

// MARK:- ㄴ SingleTon
class MainViewManager: NSObject {
    
    /// 싱글톤
    static let shared: MainViewManager = MainViewManager()
    
    /// 옵저버
    var observers: [MainObserver] = []
    
    /// 색상
    var color: UIColor = .black {
        didSet {
            self.observers.forEach { element in
                element.updateBackgroudColor(self.color)
            }
        }
    }
    
    override init() {}
}

// MARK:- ㄴ Observer Process
extension MainViewManager: MainPublisher {
    
    /// 구독 진행
    func subscribe(observer: MainObserver) {
        self.observers.append(observer)
    }

    /// 구독 해제
    func unSubscribe(observer: MainObserver) {
        if let index = self.observers.firstIndex(where: { $0.id == observer.id }) {
            self.observers.remove(at: index)
        }
    }
    
    /// 구독 전체 해제
    func unSubscribeAll() {
        self.observers.removeAll()
    }
}


