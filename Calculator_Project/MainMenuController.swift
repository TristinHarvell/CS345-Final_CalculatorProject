//
//  MainMenuController.swift
//  Calculator_Project
//
//  Created by Harvell, Tristin L on 3/26/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import Foundation
import UIKit

class MainMenuController: UIViewController {
    
    let calculatorLabel: UILabel = UILabel()
    let calculateLabel: UILabel = UILabel()
    let historyLabel: UILabel = UILabel()
    let formulasLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //screen constants
        let screenSize: CGSize = UIScreen.main.bounds.size
        //let centerX: CGFloat = screenSize.width / 2
        //let centerY: CGFloat = screenSize.height / 2
        
        //button constants
        let buttonHeight: CGFloat = screenSize.height/5
        let buttonWidth: CGFloat = screenSize.width-10
        let buttonX: CGFloat = 5
        
        //calculator menu label
        calculatorLabel.text = "Calculator"
        calculatorLabel.textColor = UIColor.white
        calculatorLabel.font = UIFont.systemFont(ofSize: 70)
        calculatorLabel.textAlignment = NSTextAlignment.center
        calculatorLabel.frame = CGRect(x: buttonX, y: buttonHeight*0+30, width: buttonWidth, height: buttonHeight)
        self.view.addSubview(calculatorLabel)
        
        //calculate label
        calculateLabel.text = "Calculate"
        calculateLabel.backgroundColor = UIColor.gray
        calculateLabel.textColor = UIColor.white
        calculateLabel.textAlignment = NSTextAlignment.center
        calculateLabel.frame = CGRect(x: buttonX, y: buttonHeight*2-35, width: buttonWidth, height: buttonHeight)
        calculateLabel.isUserInteractionEnabled = true
        calculateLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainMenuController.openCalculateMenu(_:))))
        self.view.addSubview(calculateLabel)
        
        //history label
        historyLabel.text = "History"
        historyLabel.backgroundColor = UIColor.gray
        historyLabel.textColor = UIColor.white
        historyLabel.textAlignment = NSTextAlignment.center
        historyLabel.frame = CGRect(x: buttonX, y: buttonHeight*3-30, width: buttonWidth, height: buttonHeight)
        historyLabel.isUserInteractionEnabled = true
        historyLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainMenuController.openHistoryMenu(_:))))
        self.view.addSubview(historyLabel)
        
        //formulas label
        formulasLabel.text = "Formulas"
        formulasLabel.backgroundColor = UIColor.gray
        formulasLabel.textColor = UIColor.white
        formulasLabel.textAlignment = NSTextAlignment.center
        formulasLabel.frame = CGRect(x: buttonX, y: buttonHeight*4-25, width: buttonWidth, height: buttonHeight)
        formulasLabel.isUserInteractionEnabled = true
        formulasLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MainMenuController.openFormulaMenu(_:))))
        self.view.addSubview(formulasLabel)
        
        self.view.backgroundColor = UIColor.lightGray

        
    }
    
    @objc func openCalculateMenu(_ recognizer: UITapGestureRecognizer) {
        let cm: CalculateMenuController = CalculateMenuController()
        cm.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(cm, animated: true, completion: {() -> Void in
            print("Calculate view controller presented...")
        })
    }
    
    @objc func openHistoryMenu(_ recognizer: UITapGestureRecognizer) {
        let hm: HistoryMenuController = HistoryMenuController()
        hm.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(hm, animated: true, completion: {() -> Void in
            print("History view controller presented...")
        })
    }

    @objc func openFormulaMenu(_ recognizer: UITapGestureRecognizer) {
        let fm: FormulaMenuController = FormulaMenuController()
        fm.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
        present(fm, animated: true, completion: {() -> Void in
            print("Formula view controller presented...")
        })
    }


}
