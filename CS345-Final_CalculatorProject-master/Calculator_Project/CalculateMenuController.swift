//
//  CalculateMenuController.swift
//  Calculator_Project
//
//  Created by Harvell, Tristin L on 3/26/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import Foundation
import UIKit

class CalculateMenuController: UIViewController {
    
    private var externalWindow: UIWindow?
    
    let outputAreaLabel: UILabel = UILabel()
    let zeroButton: UILabel = UILabel()
    let oneButton: UILabel = UILabel()
    let twoButton: UILabel = UILabel()
    let threeButton: UILabel = UILabel()
    let fourButton: UILabel = UILabel()
    let fiveButton: UILabel = UILabel()
    let sixButton: UILabel = UILabel()
    let sevenButton: UILabel = UILabel()
    let eightButton: UILabel = UILabel()
    let nineButton: UILabel = UILabel()
    let gestureAreaLabel: UILabel = UILabel()
    
    var previousText: String = ""
    var answer: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //screen constants
        let screenSize: CGSize = UIScreen.main.bounds.size

        //divide screen height into four sections
        let heightSection: CGFloat = screenSize.height/4
        
        //divide screen width into three sections
        let widthSection: CGFloat = screenSize.width/3
        
        //button border constant
        let borderSize: CGFloat = 2.0
        
        //output area
        outputAreaLabel.text = ""
        outputAreaLabel.font = UIFont.systemFont(ofSize: 35)
        outputAreaLabel.textColor = UIColor.black
        outputAreaLabel.backgroundColor = UIColor.white
        outputAreaLabel.textAlignment = NSTextAlignment.center
        outputAreaLabel.frame = CGRect(x: widthSection*1, y: heightSection*0, width: screenSize.width-widthSection, height: heightSection)
        self.view.addSubview(outputAreaLabel)
        
        //0 button area
        zeroButton.text = "0"
        zeroButton.textColor = UIColor.white
        zeroButton.layer.borderColor = UIColor.black.cgColor
        zeroButton.layer.borderWidth = borderSize
        zeroButton.backgroundColor = UIColor.orange
        zeroButton.textAlignment = NSTextAlignment.center
        zeroButton.frame = CGRect(x: widthSection*0, y: widthSection*0, width: screenSize.width/3, height: heightSection*1)
        zeroButton.isUserInteractionEnabled = true
        zeroButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushZero(_:))))
        self.view.addSubview(zeroButton)
        
        //1 button area
        oneButton.text = "1"
        oneButton.textColor = UIColor.white
        oneButton.layer.borderColor = UIColor.black.cgColor
        oneButton.layer.borderWidth = borderSize
        oneButton.backgroundColor = UIColor.orange
        oneButton.textAlignment = NSTextAlignment.center
        oneButton.frame = CGRect(x: widthSection*0, y: heightSection*1, width: screenSize.width/3, height: heightSection*2/3)
        oneButton.isUserInteractionEnabled = true
        oneButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushOne(_:))))
        self.view.addSubview(oneButton)
        
        //2 button area
        twoButton.text = "2"
        twoButton.textColor = UIColor.white
        twoButton
            
            .layer.borderColor = UIColor.black.cgColor
        twoButton.layer.borderWidth = borderSize
        twoButton.backgroundColor = UIColor.orange
        twoButton.textAlignment = NSTextAlignment.center
        twoButton.frame = CGRect(x: widthSection*1, y: heightSection*1, width: screenSize.width/3, height: heightSection*2/3)
        twoButton.isUserInteractionEnabled = true
        twoButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushTwo(_:))))
        self.view.addSubview(twoButton)
        
        //3 button area
        threeButton.text = "3"
        threeButton.textColor = UIColor.white
        threeButton.layer.borderColor = UIColor.black.cgColor
        threeButton.layer.borderWidth = borderSize
        threeButton.backgroundColor = UIColor.orange
        threeButton.textAlignment = NSTextAlignment.center
        threeButton.frame = CGRect(x: widthSection*2, y: heightSection*1, width: screenSize.width/3, height: heightSection*2/3)
        threeButton.isUserInteractionEnabled = true
        threeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushThree(_:))))
        self.view.addSubview(threeButton)
        
        //4 button area
        fourButton.text = "4"
        fourButton.textColor = UIColor.white
        fourButton.layer.borderColor = UIColor.black.cgColor
        fourButton.layer.borderWidth = borderSize
        fourButton.backgroundColor = UIColor.orange
        fourButton.textAlignment = NSTextAlignment.center
        fourButton.frame = CGRect(x: widthSection*0, y: heightSection*5/3, width: screenSize.width/3, height: heightSection*2/3)
        fourButton.isUserInteractionEnabled = true
        fourButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushFour(_:))))
        self.view.addSubview(fourButton)
        
        //5 button area
        fiveButton.text = "5"
        fiveButton.textColor = UIColor.white
        fiveButton.layer.borderColor = UIColor.black.cgColor
        fiveButton.layer.borderWidth = borderSize
        fiveButton.backgroundColor = UIColor.orange
        fiveButton.textAlignment = NSTextAlignment.center
        fiveButton.frame = CGRect(x: widthSection*1, y: heightSection*5/3, width: screenSize.width/3, height: heightSection*2/3)
        fiveButton.isUserInteractionEnabled = true
        fiveButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushFive(_:))))
        self.view.addSubview(fiveButton)
        
        //6 button area
        sixButton.text = "6"
        sixButton.textColor = UIColor.white
        sixButton.layer.borderColor = UIColor.black.cgColor
        sixButton.layer.borderWidth = borderSize
        sixButton.backgroundColor = UIColor.orange
        sixButton.textAlignment = NSTextAlignment.center
        sixButton.frame = CGRect(x: widthSection*2, y: heightSection*5/3, width: screenSize.width/3, height: heightSection*2/3)
        sixButton.isUserInteractionEnabled = true
        sixButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushSix(_:))))
        self.view.addSubview(sixButton)
        
        //7 button area
        sevenButton.text = "7"
        sevenButton.textColor = UIColor.white
        sevenButton.layer.borderColor = UIColor.black.cgColor
        sevenButton.layer.borderWidth = borderSize
        sevenButton.backgroundColor = UIColor.orange
        sevenButton.textAlignment = NSTextAlignment.center
        sevenButton.frame = CGRect(x: widthSection*0, y: heightSection*7/3, width: screenSize.width/3, height: heightSection*2/3)
        sevenButton.isUserInteractionEnabled = true
        sevenButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushSeven(_:))))
        self.view.addSubview(sevenButton)
        
        //8 button area
        eightButton.text = "8"
        eightButton.textColor = UIColor.white
        eightButton.layer.borderColor = UIColor.black.cgColor
        eightButton.layer.borderWidth = borderSize
        eightButton.backgroundColor = UIColor.orange
        eightButton.textAlignment = NSTextAlignment.center
        eightButton.frame = CGRect(x: widthSection*1, y: heightSection*7/3, width: screenSize.width/3, height: heightSection*2/3)
        eightButton.isUserInteractionEnabled = true
        eightButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushEight(_:))))
        self.view.addSubview(eightButton)
        
        //9 button area
        nineButton.text = "9"
        nineButton.textColor = UIColor.white
        nineButton.layer.borderColor = UIColor.black.cgColor
        nineButton.layer.borderWidth = borderSize
        nineButton.backgroundColor = UIColor.orange
        nineButton.textAlignment = NSTextAlignment.center
        nineButton.frame = CGRect(x: widthSection*2, y: heightSection*7/3, width: screenSize.width/3, height: heightSection*2/3)
        nineButton.isUserInteractionEnabled = true
        nineButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.pushNine(_:))))
        self.view.addSubview(nineButton)
        
        //gesture area
        gestureAreaLabel.backgroundColor = UIColor.black
        gestureAreaLabel.textAlignment = NSTextAlignment.center
        gestureAreaLabel.frame = CGRect(x: 0, y: heightSection*3, width: screenSize.width, height: heightSection)
        gestureAreaLabel.isUserInteractionEnabled = true
        gestureAreaLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CalculateMenuController.openMainMenu(_:))))
        self.view.addSubview(gestureAreaLabel)
        
        //swipe right - add
        let swipeRight: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalculateMenuController.add(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        gestureAreaLabel.addGestureRecognizer(swipeRight)
        
        //swipe left - subtract
        let swipeLeft: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalculateMenuController.subtract(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        gestureAreaLabel.addGestureRecognizer(swipeLeft)
        
        //swipe down - clear
        let swipeDown: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalculateMenuController.clear(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down
        gestureAreaLabel.addGestureRecognizer(swipeDown)
        
        //swipe up - equals
        let swipeUp: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(CalculateMenuController.equals(_:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        gestureAreaLabel.addGestureRecognizer(swipeUp)
        
        //set background color
        self.view.backgroundColor = UIColor.lightGray
    }
    
    @objc func pushZero(_ recognizer: UITapGestureRecognizer) {
            self.previousText = self.outputAreaLabel.text!
            self.outputAreaLabel.text = previousText + "0"
    }
    
    @objc func pushOne(_ recognizer: UITapGestureRecognizer) {
            self.previousText = self.outputAreaLabel.text!
            self.outputAreaLabel.text = previousText + "1"
    }
    
    @objc func pushTwo(_ recognizer: UITapGestureRecognizer) {
        self.previousText = self.outputAreaLabel.text!
        self.outputAreaLabel.text = previousText + "2"
    }
    
    @objc func pushThree(_ recognizer: UITapGestureRecognizer) {
        self.previousText = self.outputAreaLabel.text!
        self.outputAreaLabel.text = previousText + "3"
    }
    
    @objc func pushFour(_ recognizer: UITapGestureRecognizer) {
        self.previousText = self.outputAreaLabel.text!
        self.outputAreaLabel.text = previousText + "4"
    }
    
    @objc func pushFive(_ recognizer: UITapGestureRecognizer) {
        self.previousText = self.outputAreaLabel.text!
        self.outputAreaLabel.text = previousText + "5"
    }
    
    @objc func pushSix(_ recognizer: UITapGestureRecognizer) {
        self.previousText = self.outputAreaLabel.text!
        self.outputAreaLabel.text = previousText + "6"
    }
    
    @objc func pushSeven(_ recognizer: UITapGestureRecognizer) {
        self.previousText = self.outputAreaLabel.text!
        self.outputAreaLabel.text = previousText + "7"
    }
    
    @objc func pushEight(_ recognizer: UITapGestureRecognizer) {
        self.previousText = self.outputAreaLabel.text!
        self.outputAreaLabel.text = previousText + "8"
    }
    
    @objc func pushNine(_ recognizer: UITapGestureRecognizer) {
        self.previousText = self.outputAreaLabel.text!
        self.outputAreaLabel.text = previousText + "9"
    }
    
    @objc func add(_ recognizer: UITapGestureRecognizer) {
        self.outputAreaLabel.text = "<add>"
    }
    
    @objc func subtract(_ recognizer: UITapGestureRecognizer) {        self.outputAreaLabel.text = "<subtract>"
    }
    
    @objc func clear(_ recognizer: UITapGestureRecognizer) {
        self.outputAreaLabel.text = "<clear>"
    }
    
    @objc func equals(_ recognizer: UITapGestureRecognizer) {        self.outputAreaLabel.text = "<equals>"
    }
    
    @objc func openMainMenu(_ recognizer: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    // Method to set up an external screen.
    private func setupExternalScreen(screen: UIScreen) {
        if externalWindow == nil {
            externalWindow = UIWindow(frame: screen.bounds)
            externalWindow!.rootViewController = ExternalScreenViewController(screen: screen)
            externalWindow!.screen = screen
            externalWindow!.isHidden = false
        }
    }
    
    // Method to handle the notification when an external screen connects.
    @objc func externalScreenDidConnect(notification: NSNotification) {
        guard let screen = notification.object as? UIScreen else {
            return
        }
        setupExternalScreen(screen: screen)
    }
    
    // Method to handle the notification when an external screen disconnects.
    @objc func externalScreenDidDisconnect(notification: NSNotification) {
        guard let _ = notification.object as? UIScreen else {
            return
        }
        if let ew = externalWindow {
            ew.isHidden = true
            externalWindow = nil
        }
    }
    
}
