//
//  FormulaMenuController.swift
//  Calculator_Project
//
//  Created by Harvell, Tristin L on 3/26/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import Foundation
import UIKit

class FormulaMenuController: UIViewController {
    
    private var externalWindow: UIWindow?
    
    let mainMenuLabel: UILabel = UILabel()
    let addLabel: UILabel = UILabel()
    let removeLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        
        //screen constants
        let screenSize: CGSize = UIScreen.main.bounds.size
        //let centerX: CGFloat = screenSize.width / 2
        //let centerY: CGFloat = screenSize.height / 2
        
        //button constants
        let buttonHeight: CGFloat = screenSize.height/5
        let buttonWidth: CGFloat = screenSize.width-10
        let buttonX: CGFloat = 5

        //add formula label
        addLabel.text = "Add"
        addLabel.backgroundColor = UIColor.black
        addLabel.textColor = UIColor.white
        addLabel.textAlignment = NSTextAlignment.center
        addLabel.frame = CGRect(x: buttonX, y: buttonHeight*2-35, width: buttonWidth, height: buttonHeight)
        addLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.openMainMenu(_:))))
        self.view.addSubview(addLabel)
        
        //remove formula label
        removeLabel.text = "Remove"
        removeLabel.backgroundColor = UIColor.black
        removeLabel.textColor = UIColor.white
        removeLabel.textAlignment = NSTextAlignment.center
        removeLabel.frame = CGRect(x: buttonX, y: buttonHeight*3-30, width: buttonWidth, height: buttonHeight)
        removeLabel.isUserInteractionEnabled = true
        removeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.openMainMenu(_:))))
        self.view.addSubview(removeLabel)
        
        //main menuLabel label
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.backgroundColor = UIColor.black
        mainMenuLabel.textColor = UIColor.white
        mainMenuLabel.textAlignment = NSTextAlignment.center
        mainMenuLabel.frame = CGRect(x: buttonX, y: buttonHeight*4-25, width: buttonWidth, height: buttonHeight)
        mainMenuLabel.isUserInteractionEnabled = true
        mainMenuLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.openMainMenu(_:))))
        self.view.addSubview(mainMenuLabel)
        
        self.view.backgroundColor = UIColor.lightGray
        
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
