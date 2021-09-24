//
//  BottomSubView.swift
//  ObserverPattern
//
//  Created by yuhyeonjae on 2021/09/24.
//

import UIKit

class BottomSubView: UIView {
    
    // MARK:- ㄴ 생성자
    class func instance(_ id: String) -> BottomSubView {
        let view = BottomSubView()
        view.id = id
        view.initView()
        return view
    }
    
    // MARK:- ㄴ Properties
    var id: String = ""
    
    /// 뷰 초기화
    func initView() {
        self.backgroundColor = .black
    }
}

// MARK:- ㄴ 옵저버 처리
extension BottomSubView: MainObserver {
    /// 색상 업데이트
    func updateBackgroudColor(_ color: UIColor) {
        self.backgroundColor = color
    }
}
