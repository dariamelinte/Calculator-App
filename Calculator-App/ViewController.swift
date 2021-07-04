//
//  ViewController.swift
//  Calculator-App
//
//  Created by Melinte Daria on 02.07.2021.
//

import UIKit

enum Signs {
    case increase, decrease, multiply, divide
}

class ViewController: UIViewController {

    var sum = "0";
    var newNumber = "0";
    var currentSign: Signs? = nil;

    func removeUnusedPoint () {
        if (sum.last == ".") {
            sum.remove(at: sum.index(before: sum.endIndex));
        }
    }
    
    func addNumber (newSum: String, number: String) -> String {
        var currentSum: String? = nil;
        
        if (newSum == "0") {
            currentSum = number;
        } else {
            currentSum = newSum + number;
        }

        resultsLabel.text = currentSum;
        return currentSum!;
    }
    
    func calculation (sign: Signs?) {
        var finalResult: Float = 0;

        switch currentSign {
        case .increase:
            finalResult = Float(sum)! + Float(newNumber)!;
            sum = String(finalResult);
        case .decrease:
            finalResult = Float(sum)! - Float(newNumber)!;
            sum = String(finalResult);
        case .multiply:
            finalResult = Float(sum)! * (Float(newNumber) ?? 1);
            sum = String(finalResult);
        case .divide:
            finalResult = Float(sum)! / (Float(newNumber) ?? 1);
            sum = String(finalResult);
        default:
            sum = "0";
        }
        
        newNumber = "0";
        currentSign = sign ?? nil;

        resultsLabel.text = sum;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultsLabel.text = sum;
    }
    
    @IBOutlet weak var resultsLabel: UILabel!
    
    @IBAction func numberButton (_ button: UIButton) {
        let num = button.currentTitle!;

        if (currentSign != nil) {
            newNumber = addNumber(newSum: newNumber, number: num);
            return;
        }

        sum = addNumber(newSum: sum, number: num);
    }
    
    @IBAction func pointButton(_ sender: Any) {
        if (sum.contains(".")) {
            return;
        }
        
        sum = sum + ".";
        resultsLabel.text = sum;
    }
    
    @IBAction func acButton(_ button: UIButton) {
        sum = "0";
        resultsLabel.text = sum;
    }
    
    @IBAction func changeSignButton(_ button: UIButton) {
        if (sum.first == "-") {
            sum.removeFirst();
        } else {
            sum = "-" + sum;
        }
        
        resultsLabel.text = sum;
    }

    @IBAction func procentButton(_ button: UIButton) {
        if (sum == "0") {
            return;
        }

        removeUnusedPoint();

        let firstPoint = sum.firstIndex(of: ".");

        if (firstPoint != nil) {
            // get the number before the '.'
            let firstPartOfSum = sum[..<firstPoint!];

            // get the number after the '.'
            let range = sum.index(after: firstPoint!)..<sum.endIndex;

            if (Int(firstPartOfSum)! < 10) {
                // i do not save the fractionalNumber directly to the sum in order to be converted
                // to a easier number in float format. ex: 0.00004567 -> 4.567e-05
                let fractionalNumber = "0" + "." + "0" + firstPartOfSum + sum[range];
                sum = String(Float(fractionalNumber)!);
            } else {
                sum = String(Int(firstPartOfSum)! / 100) + "." + String(Int(firstPartOfSum)! % 100) + sum[range];
            }
        } else {
            sum = String(Float(sum)! / 100);
        }
        resultsLabel.text = sum;
    }
    
    @IBAction func divideButton(_ sender: Any) {
        removeUnusedPoint();
        if (currentSign != nil) {
            calculation(sign: currentSign);
        }
        currentSign = Signs.divide;
        
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        removeUnusedPoint();
        if (currentSign != nil) {
            calculation(sign: currentSign);
        }
        currentSign = Signs.multiply;
    }
    
    @IBAction func decreaseButton(_ sender: Any) {
        removeUnusedPoint();
        if (currentSign != nil) {
            calculation(sign: currentSign);
        }
        currentSign = Signs.decrease;
    }
    
    @IBAction func increaseButton(_ button: UIButton) {
        removeUnusedPoint();
        if (currentSign != nil) {
            calculation(sign: currentSign);
        }
        currentSign = Signs.increase;
    }
    
    @IBAction func equalButton(_ sender: Any) {
        calculation(sign: nil);
    }
}

