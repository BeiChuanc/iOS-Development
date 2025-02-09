//
//  UINSController.swift
//  IOS_UIKit
//
//  Created by 北川 on 2025/2/9.
//

import Foundation
import UIKit

class UINSController: UIViewController {
    
    // UIView
    var OuterView = UIView.init()
    
    // 初始化视图
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("初始化制图控制器")
        
        // 添加监听, object可用于传值
        NotificationCenter.default.addObserver(self, selector: #selector(notification), name: NSNotification.Name(NotificationName.UINS.rawValue), object: nil)
    }
    
    // 实例化
    required init?(coder: NSCoder) {
        print("实例化中") // Storyboard、XIB加载视图
        fatalError("init(coder:) has not been implemented")
    }
    
    // 视图加载完毕
    override func viewDidLoad() {
        super.viewDidLoad()
        print("视图加载完毕")
        
        setUpUILayout()
    }
    
    // 视图将出现
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("视图将出现")
    }
    
    // 布局将要发生变化
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("布局发生变化")
    }
    
    // 视图将消失
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("视图将消失")
    }
    
    // 对象释放自动调用
    deinit {
        print("对象释放")
        // 移除监听
        NotificationCenter.default.removeObserver(self)
    }
    
    // 监听
    @objc func notification() {
        print("监听方法被调用")
    }
    
    func setUpUILayout() {
        
        OuterView.frame = CGRect(x: 0, y: 0, width: Int(APPSCREEN.WIDTH), height: Int(APPSCREEN.HEIGHT))
        view.addSubview(OuterView)
        view.backgroundColor = .red
        
    }
    
}
