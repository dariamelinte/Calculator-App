//
//  ViewController.swift
//  Calculator-App
//
//  Created by Melinte Daria on 02.07.2021.
//

import UIKit

enum Signs {
    case ac, changeSign, procent, divide, multiply, decrease, increase, point, equal;
}

var Numbers: Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];

class ViewController: UIViewController {

    var sum = "0";
    
    var currentSign = "";
    
    func changeSignOfTheCalculus (sign: Signs) {
//        switch sign {
//        case sign === "-:
//            <#code#>
//        default:
//            <#code#>
//        }
    }
    
    func addNumberToSum (number: Int) {
        sum = sum + String(number);
        resultsLabel.text = sum;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = sum;
    }
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBAction func numberButton (_ button: UIButton) {
        if (sum == "0") {
            sum = button.currentTitle!;
        } else {
            sum = sum + button.currentTitle!;
        }
        resultsLabel.text = sum;
    }
    
    @IBAction func acButton(_ sender: Any) {
    }
    
    @IBAction func changeSignButton(_ sender: Any) {
    }

    @IBAction func procentButton(_ sender: Any) {
    }
    
    @IBAction func divideButton(_ sender: Any) {
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
    }
    
    @IBAction func decreaseButton(_ sender: Any) {
    }
    
    @IBAction func increaseButton(_ sender: Any) {
    }
    
    @IBAction func pointButton(_ sender: Any) {
    }
    
    @IBAction func equalButton(_ sender: Any) {
    }
}

