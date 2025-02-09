//
//  AppDelegate.swift
//  IOS_UIKit
//
//  Created by 北川 on 2025/2/9.
//

import UIKit
import CoreData
import AVFoundation

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var progressView: UIProgressView?
    
    var imgProgressView: UIImageView?
    
    var displayLink: CADisplayLink?
    
    var startTime: CFTimeInterval?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        window?.rootViewController = UINSController()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // 应用即将进入非活跃状态
        print("应用即将进入非活跃状态")
    }
    
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // 应用进入后台
        print("应用进入后台")
    }
    
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // 应用即将进入前台
        print("应用即将进入前台")
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // 应用进入活跃状态
        print("应用进入活跃状态")
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        // 应用即将终止
        print("应用即将终止")
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IOS_UIKit")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    // Launch load video play.
    func loadVideoEnter(on view: UIView, _ window: UIWindow) {
        
        guard let videoURL = Bundle.main.url(forResource: "", withExtension: "mp4") else { return }
        
        let player = AVPlayer(url: videoURL)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(playerLayer)
        
        player.play()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6, execute: {
            player.pause()
            playerLayer.removeFromSuperlayer()
            
            PageControlRoute.goWelcome(window)
        })
        
    }
    
    // Launch load animation.
    func loadSlider() {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        if let launchScreen = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateInitialViewController() {
            
            window?.rootViewController = launchScreen
            window?.makeKeyAndVisible()
            
            progressView = launchScreen.view.viewWithTag(1) as? UIProgressView
            imgProgressView = launchScreen.view.viewWithTag(2) as? UIImageView
            progressView?.isHidden = false
            imgProgressView?.isHidden = false
            progressView?.progress = 0.0
            progressView?.layer.cornerRadius = 10
            progressView?.layer.masksToBounds = true
            progressView?.layer.borderWidth = 1.5
            progressView?.layer.borderColor = UIColor.white.cgColor
            progressView?.layer.sublayers?.forEach { $0.cornerRadius = 10 }
            progressView?.subviews[1].layer.masksToBounds = true
            
            let launchText = UILabel()
            let launchImage = UIImageView.init(image: UIImage(named: "syang"))
            launchText.translatesAutoresizingMaskIntoConstraints = false
            launchImage.translatesAutoresizingMaskIntoConstraints = false
            launchText.numberOfLines = 0
            launchImage.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
            launchImage.contentMode = .scaleAspectFit
            
            let text = "飞鸟轻鸣      \n      浪涛欢唱"
            let fontName = BaseFunManager.shared.getActualFontName(from: "shiyidelucheng")
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 10
            paragraphStyle.alignment = .center
            let attributes: [NSAttributedString.Key: Any] = [
                .paragraphStyle: paragraphStyle,
                .font: UIFont(name: fontName!, size: 50) as Any
            ]
            
            let attributedText = NSAttributedString(string: text, attributes: attributes)
            launchText.attributedText = attributedText
            
            launchScreen.view.addSubview(launchText)
            launchScreen.view.addSubview(launchImage)
            
            NSLayoutConstraint.activate([
                launchText.topAnchor.constraint(equalTo: launchScreen.view.safeAreaLayoutGuide.topAnchor, constant: 60),
                launchText.leadingAnchor.constraint(equalTo: launchScreen.view.leadingAnchor),
                launchText.centerXAnchor.constraint(equalTo: launchScreen.view.centerXAnchor),
                
                launchImage.topAnchor.constraint(equalTo: launchText.bottomAnchor, constant: 20),
                launchImage.centerXAnchor.constraint(equalTo: launchScreen.view.centerXAnchor)
            ])
            
            launchAnimateLoading()
        }
    }
    
    func launchAnimateLoading() {
        startTime = CACurrentMediaTime()
        displayLink = CADisplayLink(target: self, selector: #selector(updateProgress))
        displayLink?.add(to: .main, forMode: .common)
    }

    @objc func updateProgress() {
        guard let progressView = self.progressView, let startTime = startTime else { return }
        
        let elapsedTime = CACurrentMediaTime() - startTime
        let totalDuration = 2.0 // 总时长
        let progress = min(elapsedTime / totalDuration, 1)
        
        progressView.progress = Float(progress)
        let progressWidth = CGFloat(progress) * progressView.frame.width
        if let imgProgressView = self.imgProgressView {
            imgProgressView.frame.origin.x = 90 + progressWidth - (imgProgressView.frame.width / 2)
        }
        
        if progress >= 1 {
            displayLink?.invalidate()
            displayLink = nil
            PageControlRoute.goWelcome(window!)
        }
    }
}

