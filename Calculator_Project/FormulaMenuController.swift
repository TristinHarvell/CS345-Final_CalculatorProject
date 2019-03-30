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
    let formulaHeader: UILabel = UILabel()
    
    override func viewDidLoad() {
        
        //screen constants
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let centerY: CGFloat = screenSize.height / 2
        
        //assign the first tenth of the screen's height to the menu
        let formulaHeaderSection: CGFloat = screenSize.height/10
        
        //button constants
        let buttonHeight: CGFloat = screenSize.height/7
        let buttonWidth: CGFloat = screenSize.width-10
        let buttonX: CGFloat = 5
        
        //previous data menu header
        formulaHeader.attributedText = NSAttributedString(string: "Favorite Formulas", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        formulaHeader.font = UIFont.systemFont(ofSize: 22)
        formulaHeader.textColor = UIColor.black
        formulaHeader.textAlignment = NSTextAlignment.center
        formulaHeader.frame = CGRect(x: centerX/2, y: formulaHeaderSection/2, width: centerX, height: formulaHeaderSection)
        self.view.addSubview(formulaHeader)

        //add formula label
        addLabel.text = "Add"
        addLabel.backgroundColor = UIColor.black
        addLabel.textColor = UIColor.white
        addLabel.textAlignment = NSTextAlignment.center
        addLabel.frame = CGRect(x: buttonX, y: buttonHeight*4-35, width: buttonWidth, height: buttonHeight)
        addLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.addFormula(_:))))
        self.view.addSubview(addLabel)
        
        //remove formula label
        removeLabel.text = "Remove"
        removeLabel.backgroundColor = UIColor.black
        removeLabel.textColor = UIColor.white
        removeLabel.textAlignment = NSTextAlignment.center
        removeLabel.frame = CGRect(x: buttonX, y: buttonHeight*5-30, width: buttonWidth, height: buttonHeight)
        removeLabel.isUserInteractionEnabled = true
        removeLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.removeFormula(_:))))
        self.view.addSubview(removeLabel)
        
        //main menuLabel label
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.backgroundColor = UIColor.black
        mainMenuLabel.textColor = UIColor.white
        mainMenuLabel.textAlignment = NSTextAlignment.center
        mainMenuLabel.frame = CGRect(x: buttonX, y: buttonHeight*6-25, width: buttonWidth, height: buttonHeight)
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
    
    @objc func addFormula(_ recognizer: UITapGestureRecognizer) {
    }
    
    @objc func removeFormula(_ recognizer: UITapGestureRecognizer) {
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
