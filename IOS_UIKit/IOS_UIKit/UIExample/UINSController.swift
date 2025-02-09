//
//  UINSController.swift
//  IOS_UIKit
//
//  Created by 北川 on 2025/2/9.
//

import Foundation
import UIKit

class UINSController: UIViewController {
    
    var outerView = UIView.init()
    
    var showLabel = UILabel.init()
    
    var showImage = UIImageView.init(image: UIImage(named: "pig"))
    
    // Initializing the View
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("Initialize the drawing controller.")
        
        // Add listener, object can be used to pass value.
        NotificationCenter.default.addObserver(self, selector: #selector(notification), name: NSNotification.Name(NotificationName.UINS.rawValue), object: nil)
    }
    
    // Instantiation
    required init?(coder: NSCoder) {
        print("Instantiating")
        fatalError("init(coder:) has not been implemented")
    }
    
    // View loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View loaded")
        view.backgroundColor = .white
        
        setUpUILayout()
    }
    
    // The view will appear.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("The view will appear")
    }
    
    // The layout is going to change.
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("Layout changes")
    }
    
    // The view will disappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("The view will disappear")
    }
    
    // Object release is automatically called.
    deinit {
        print("Object Release")
        // Remove Listener
        NotificationCenter.default.removeObserver(self)
    }
    
    // monitor
    @objc func notification() {
        print("The listener method is called.")
    }
    
    func setUpUILayout() {
        outerView.frame = CGRect(x: 0, y: 0, width: Int(APPSCREEN.WIDTH), height: Int(APPSCREEN.HEIGHT))
        view.addSubview(outerView)
    }
}
