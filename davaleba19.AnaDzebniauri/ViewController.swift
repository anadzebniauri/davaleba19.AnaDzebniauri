//
//  ViewController.swift
//  davaleba19.AnaDzebniauri
//
//  Created by Ana Dzebniauri on 26.07.22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
       
    lazy var purpleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "purple_image")
        return imageView
    }()
    
    lazy var lbl_1ContainerView: UIView = {
        print("🌕")
        var lbl_1ContainerView = UIView()
        view.addSubview(lbl_1ContainerView)
        return lbl_1ContainerView
    }()
      
    let circleView = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        background()
        purpleImageView.addBlueGradientLayerInBackground(frame: view.bounds, colors:[.purple, .blue])
//        addCircle()
        
        let lbl_1 = UILabel(frame: CGRect(x: 100, y: 100, width: 600, height: 100))
        lbl_1.center = CGPoint(x: 200, y: 100)
        lbl_1.textAlignment = .center
        lbl_1.text = "IOS App Templates"
        self.view.addSubview(lbl_1)
        
        addLbl_1ContainerView()
    }

    private func background() {
        purpleImageView.frame = self.view.frame

        guard let image = UIImage(named: "purple_image") else {
            print("Wrong Image name")
            return
        }
        purpleImageView.image = image
        purpleImageView.contentMode = .scaleToFill

//        let gradient = CAGradientLayer()
//        gradient.frame = purpleImageView.frame
//        gradient.colors = [UIColor.blue.cgColor]
//        gradient.locations = [0.0]
//        purpleImageView.layer.insertSublayer(gradient, at: 0)

        self.view.addSubview(purpleImageView)
        purpleImageView.backgroundColor = .blue

        purpleImageView.translatesAutoresizingMaskIntoConstraints = false
        purpleImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        purpleImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        purpleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        purpleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    
    
    func addLbl_1ContainerView() {
        lbl_1ContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lbl_1ContainerView)
        
        let leftConstraint = NSLayoutConstraint(item: lbl_1ContainerView,
                                                attribute: .left,
                                                relatedBy: .equal,
                                                toItem: view.layoutMarginsGuide,
                                                attribute: .left,
                                                multiplier: 1,
                                                constant: 10).isActive = true

        let top = NSLayoutConstraint(item: lbl_1ContainerView,
                                                attribute: .top,
                                                relatedBy: .equal,
                                     toItem: view.safeAreaLayoutGuide,
                                                attribute: .top,
                                                multiplier: 1,
                                                constant: 0).isActive = true

        let right = NSLayoutConstraint(item: lbl_1ContainerView,
                                                attribute: .right,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: .right,
                                                multiplier: 1,
                                                constant: 20).isActive = true


        let width = NSLayoutConstraint(item: lbl_1ContainerView,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 50).isActive = true

        let height = NSLayoutConstraint(item: lbl_1ContainerView,
                                       attribute: .height,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: 100).isActive = true

    }


    func addCircle() {
        view.addSubview(circleView)
        let screenWidth = view.frame.width
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = .green
        circleView.layer.cornerRadius = screenWidth/6
        circleView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        circleView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let width = NSLayoutConstraint(item: circleView,
                                       attribute: .width,
                                       relatedBy: .equal,
                                       toItem: nil,
                                       attribute: .notAnAttribute,
                                       multiplier: 1,
                                       constant: screenWidth/3).isActive = true
        
        let aspectRatio = NSLayoutConstraint(item: circleView,
                                             attribute: .height,
                                             relatedBy: .equal,
                                             toItem: circleView,
                                             attribute: .width,
                                             multiplier: 1,
                                             constant: 0).isActive = true
    }
    
}


extension UIImageView {
    
   func addBlueGradientLayerInBackground(frame: CGRect, colors:[UIColor]){
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.insertSublayer(gradient, at: 0)
   }
}

