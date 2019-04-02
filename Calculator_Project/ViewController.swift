//
//  ViewController.swift
//  Calculator_Project
//
//  Created by Amel, Nukic L on 3/30/19.
//  Copyright © 2019 Harvell, Tristin L. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    let mainMenuLabel: UILabel = UILabel()
    let formulaHeader: UILabel = UILabel()
    
    var tableView = UITableView()
    var tableData = ["Discount\n" , " Interest\n", " Tips\n", " SalesTax\n"]
    var tableData2 = ["ListPrice * Discount Price", "Principle * Rate * Time","Cost * Tip Percentage Rate", "Price Of Item * Tax Rate"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.reloadData()
        
        
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
        
        tableView = UITableView(frame: self.view.bounds, style: UITableView.Style.plain)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.white
        tableView.rowHeight = 100
        
        

        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "my")
        view.addSubview(tableView)
        
        //main menuLabel label
        mainMenuLabel.text = "Main Menu"
        mainMenuLabel.backgroundColor = UIColor.darkGray
        mainMenuLabel.textColor = UIColor.white
        mainMenuLabel.textAlignment = NSTextAlignment.center
        mainMenuLabel.frame = CGRect(x: buttonX, y: buttonHeight*6-25, width: buttonWidth, height: buttonHeight)
        mainMenuLabel.isUserInteractionEnabled = true
        mainMenuLabel.layer.cornerRadius = 10.0
        mainMenuLabel.clipsToBounds = true
        mainMenuLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(FormulaMenuController.openMainMenu(_:))))
        self.view.addSubview(mainMenuLabel)
        
        self.view.backgroundColor = UIColor.lightGray
        
        //previous data menu header
        formulaHeader.attributedText = NSAttributedString(string: "Favorite Formulas", attributes:
            [.underlineStyle: NSUnderlineStyle.single.rawValue])
        formulaHeader.font = UIFont.systemFont(ofSize: 22)
        formulaHeader.textColor = UIColor.black
        formulaHeader.textAlignment = NSTextAlignment.center
        formulaHeader.frame = CGRect(x: centerX/2, y: formulaHeaderSection/2, width: centerX, height: formulaHeaderSection)
        self.view.addSubview(formulaHeader)
        
       
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "my", for: indexPath)
        cell.textLabel?.text = " \(tableData[indexPath.row]) \(tableData2[indexPath.row])"
        cell.textLabel!.numberOfLines = 0
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    //method to re-open main menu
    @objc func openMainMenu(_ recognizer: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
    
    // method to allow multiple lines in table cell
    func allowMultipleLines(tableViewCell:UITableViewCell) {
        tableViewCell.textLabel?.numberOfLines = 2
        tableViewCell.textLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
    }
    
}
    


