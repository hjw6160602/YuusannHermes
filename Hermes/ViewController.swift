//
//  ViewController.swift
//  Hermes
//
//  Created by SaiDiCaprio on 2021/1/12.
//

import UIKit
import WebKit

let kMargin: CGFloat = 8

let kScreenFrame  = UIScreen.main.bounds
let kScreenHeight = UIScreen.main.bounds.height
let kScreenWidth  = UIScreen.main.bounds.width
let kStatusBarH   = UIApplication.shared.statusBarFrame.height

let isPhoneX_Series = (kScreenWidth >= 375) && (kScreenHeight >= 812)

let kCustomNaviBarH = CGFloat(44)
let kNavigationBarH = kStatusBarH + kCustomNaviBarH
let kBottomMargin: CGFloat = isPhoneX_Series ? 34 : 0
let kTabBarH = kBottomMargin + 49


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusView = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kStatusBarH))
        statusView.backgroundColor = .rgb(0, 51, 102)
        view.addSubview(statusView)
        
        if isPhoneX_Series {
            let y = kScreenHeight - kBottomMargin
            let bottomView = UIView(frame: CGRect(x: 0, y: y, width: kScreenWidth, height: kBottomMargin))
            bottomView.backgroundColor = .gray(250)
            view.addSubview(bottomView)
        }
        
        view.addSubview(hermesView)
    }
    
    lazy var hermesView: WKWebView = {
        let wv = WKWebView()
        let height = view.bounds.height - kStatusBarH - kBottomMargin
        wv.frame = CGRect(x: 0, y: kStatusBarH, width: kScreenWidth, height: height)
        if let url = URL(string: "https://hermes.yuusann.com/") {
            let request = URLRequest(url: url)
            wv.load(request)
        }
        return wv
    }()
}

