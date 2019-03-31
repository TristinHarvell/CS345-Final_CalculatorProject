//
//  FormulaMenuController.swift
//  Calculator_Project
//
//  Created by Harvell, Tristin L on 3/26/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import Foundation
import UIKit

class FormulaMenuController: UIViewController{
    
    private var externalWindow: UIWindow?
    
    let mainMenuLabel: UILabel = UILabel()
    let addLabel: UILabel = UILabel()
    let removeLabel: UILabel = UILabel()
    let formulaHeader: UILabel = UILabel()
    let discount: UILabel = UILabel()
    let discount2: UILabel = UILabel()
    let interest: UILabel = UILabel()
    let interest2: UILabel = UILabel()
    let tips: UILabel = UILabel()
    let tips2: UILabel = UILabel()
    let salesTax: UILabel = UILabel()
    let salesTax2: UILabel = UILabel()
    
    override func viewDidLoad() {
        
        //screen constants
        let screenSize: CGSize = UIScreen.main.bounds.size
        let centerX: CGFloat = screenSize.width / 2
        let _: CGFloat = screenSize.height / 2
        
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
        mainMenuLabel.backgroundColor = UIColor.darkGray
        mainMenuLabel.textColor = UIColor.white
        mainMenuLabel.textAlignment = NSTextAlignment.center
        mainMenuLabel.frame = CGRect(x: buttonX, y: buttonHeight*6-25, width: buttonWidth, height: buttonHeight)
        mainMenuLabel.isUserInteractionEnabled = true
        mainMenuLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.openMainMenu(_:))))
        self.view.addSubview(mainMenuLabel)
        
        self.view.backgroundColor = UIColor.lightGray
        
        
        discount.text = "Discount Formula"
        discount.backgroundColor = UIColor.black
        discount.textColor = UIColor.white
        discount.textAlignment = NSTextAlignment.center
        discount.frame = CGRect(x: buttonX, y: buttonHeight*1-20, width: buttonWidth, height: 20)
        discount.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.discountFormula(_:))))
        self.view.addSubview(discount)
        
        discount2.text = "List price * Discount Rate"
        discount2.backgroundColor = UIColor.clear
        discount2.textColor = UIColor.red
        discount2.textAlignment = NSTextAlignment.center
        discount2.frame = CGRect(x: buttonX, y: buttonHeight*1.25-20, width: buttonWidth, height: 20)
        discount2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.discountFormula2(_:))))
        self.view.addSubview(discount2)
        
        interest.text = "Interest Formula"
        interest.backgroundColor = UIColor.black
        interest.textColor = UIColor.white
        interest.textAlignment = NSTextAlignment.center
        interest.frame = CGRect(x: buttonX, y: buttonHeight*1.5-20, width: buttonWidth, height: 25)
        interest.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.interestFormula(_:))))
        self.view.addSubview(interest)
        
        interest2.text = "Principle * Rate * Time"
        interest2.backgroundColor = UIColor.clear
        interest2.textColor = UIColor.red
        interest2.textAlignment = NSTextAlignment.center
        interest2.frame = CGRect(x: buttonX, y: buttonHeight*1.75-20, width: buttonWidth, height: 25)
        interest2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.interestFormula2(_:))))
        self.view.addSubview(interest2)
        
        tips.text = "Tips Formula"
        tips.backgroundColor = UIColor.black
        tips.textColor = UIColor.white
        tips.textAlignment = NSTextAlignment.center
        tips.frame = CGRect(x: buttonX, y: buttonHeight*2-20, width: buttonWidth, height: 25)
        tips.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.tipsFormula(_:))))
        self.view.addSubview(tips)
        
        tips2.text = "Meal Cost * Tip Percentage Rate"
        tips2.backgroundColor = UIColor.clear
        tips2.textColor = UIColor.red
        tips2.textAlignment = NSTextAlignment.center
        tips2.frame = CGRect(x: buttonX, y: buttonHeight*2.25-20, width: buttonWidth, height: 25)
        tips2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.tipsFormula2(_:))))
        self.view.addSubview(tips2)
        
        salesTax.text = "Sales Tax Formula"
        salesTax.backgroundColor = UIColor.black
        salesTax.textColor = UIColor.white
        salesTax.textAlignment = NSTextAlignment.center
        salesTax.frame = CGRect(x: buttonX, y: buttonHeight*2.5-20, width: buttonWidth, height: 25)
        salesTax.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.salesTaxFormula(_:))))
        self.view.addSubview(salesTax)
        
        salesTax2.text = "Price Of Item * Tax Rate"
        salesTax2.backgroundColor = UIColor.clear
        salesTax2.textColor = UIColor.red
        salesTax2.textAlignment = NSTextAlignment.center
        salesTax2.frame = CGRect(x: buttonX, y: buttonHeight*2.75-20, width: buttonWidth, height: 25)
        salesTax2.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.salesTaxFormula2(_:))))
        self.view.addSubview(salesTax2)
        
        
        
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
    @objc func discountFormula(_ recognizer: UITapGestureRecognizer) {
    }
    @objc func discountFormula2(_ recognizer: UITapGestureRecognizer) {
    }
    @objc func interestFormula(_ recognizer: UITapGestureRecognizer) {
    }
    @objc func interestFormula2(_ recognizer: UITapGestureRecognizer) {
    }
    @objc func tipsFormula(_ recognizer: UITapGestureRecognizer) {
    }
    @objc func tipsFormula2(_ recognizer: UITapGestureRecognizer) {
    }
    @objc func salesTaxFormula(_ recognizer: UITapGestureRecognizer) {
    }
    @objc func salesTaxFormula2(_ recognizer: UITapGestureRecognizer) {
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
