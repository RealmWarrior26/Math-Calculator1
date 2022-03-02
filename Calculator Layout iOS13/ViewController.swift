//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.

//  Enhanced by Jeremy
//  Last updated 2/24/2022

import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var screenLabel: UILabel!
    
    //Explicit variable declaration
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath = false
    var newCalculation = false
    var operation = 0
    var reverseVal: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.                
    }

    @IBAction func numbers(_ sender: UIButton) {
        
        //print(sender.currentTitle)--- You can use this as well instead of the tags. Tags (e.g., 1, 2, 3… would be more flexible)
        //print(sender.tag)
        //print(screenLabel.text!)
        
        //check whether an operator is pressed
        if performingMath == true {
            screenLabel.text = String(sender.tag - 1)
            numberOnScreen = Double(screenLabel.text!)!
            performingMath = false
        } else {
            //reset screen to empty
            if screenLabel.text == "0" || newCalculation == true {
                screenLabel.text = ""
            }
            if sender.tag == 19 {
                screenLabel.text = screenLabel.text! + "."  //create the on screen input text
            }else{
                screenLabel.text = screenLabel.text! + String(sender.tag - 1)  //create the on screen input text
            }
            numberOnScreen = Double(screenLabel.text!)!
            newCalculation = false
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        
        //This can be done at the design level.
        if (screenLabel.text != "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 17 && sender.tag != 18 ){ //operators
            
            previousNumber = Double(screenLabel.text!)!
            
            switch sender.tag {
                case 12:
                    screenLabel.text = "/"
                case 13:
                    screenLabel.text = "x"
                case 14:
                    screenLabel.text = "-"
                case 15:
                    screenLabel.text = "+"
                default:
                    screenLabel.text = "Error! Check the entry!"
            }
            operation = sender.tag
            performingMath = true;
            
       } else if sender.tag == 16 { //equal = button
            //You can also use switch case here
            if operation == 12{ //Divide
                screenLabel.text = String(previousNumber / numberOnScreen)
            }
            else if operation == 13{ //Multiply
                screenLabel.text = String(previousNumber * numberOnScreen)
            }
            else if operation == 14{ //Subtract
                screenLabel.text = String(previousNumber - numberOnScreen)
            }
            else if operation == 15{ //Add
                screenLabel.text = String(previousNumber + numberOnScreen)
            }
            performingMath = false
            newCalculation = true
        }
        else if sender.currentTitle == "AC"{ //AC button
            screenLabel.text = "0"
            previousNumber = 0
            numberOnScreen = 0
            operation = 0
        }
       
    }
      
    
}

