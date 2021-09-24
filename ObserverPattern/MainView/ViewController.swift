//
//  ViewController.swift
//  ObserverPattern
//
//  Created by yuhyeonjae on 2021/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    /// 탑 뷰
    private var topView: TopSubView? = nil
    
    /// 바텀 뷰
    private var bottomView: BottomSubView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initView()
    }
    
    /// 뷰 초기 설정
    private func initView() {
        // 1. 탑 뷰 생성
        if nil == self.topView {
            self.topView = TopSubView.instance("TOP")
            
            guard let topView = self.topView else { return }
            
            self.view.addSubview(topView)
            MainViewManager.shared.subscribe(observer: topView)
        }
        
        // 2. 바텀 뷰 생성
        if nil == self.bottomView {
            self.bottomView = BottomSubView.instance("BOTTOM")
            
            guard let bottomView = self.bottomView else { return }
            
            self.view.addSubview(bottomView)
            MainViewManager.shared.subscribe(observer: bottomView)
        }
        
        // 레이아웃 설정
        self.setLayoutSubView()
    }
    
    /// 레이아웃 설정
    private func setLayoutSubView() {
        self.topView?.translatesAutoresizingMaskIntoConstraints = false
        self.topView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.topView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.topView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.topView?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        self.bottomView?.translatesAutoresizingMaskIntoConstraints = false
        self.bottomView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.bottomView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.bottomView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.bottomView?.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}

// MARK:- ㄴ Actions
extension ViewController {
    /// 버튼 클릭 시
    @IBAction func didTappedClickBtn(_ sender: UIButton) {
        let red = Int.random(in: 0...255)
        let green = Int.random(in: 0...255)
        let blue = Int.random(in: 0...255)
        
        let makeColor = UIColor(red: CGFloat(red) / 255,
                                green: CGFloat(green) / 255,
                                blue: CGFloat(blue) / 255,
                                alpha: 1.0)
        
        MainViewManager.shared.color = makeColor
    }
}

