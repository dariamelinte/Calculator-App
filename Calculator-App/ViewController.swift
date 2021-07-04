//
//  ViewController.swift
//  Calculator-App
//
//  Created by Melinte Daria on 02.07.2021.
//

import UIKit

class ViewController: UIViewController {

    var sum = "0";
    var currentSign = "";

    func removeUnusedPoint () {
        if (sum.last == ".") {
            sum.remove(at: sum.index(before: sum.endIndex));
        }
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
    
    @IBAction func pointButton(_ sender: Any) {
        if (sum.contains(".")) {
            return;
        }
        
        sum = sum + ".";
        resultsLabel.text = sum;
    }
    
    @IBAction func showActiveOperation (_ button: UIButton) {
        removeUnusedPoint();

        currentSign = button.currentTitle!;

        //        if (currentSign == button.currentTitle) {
        //            button.backgroundColor = #colorLiteral(red: 1, green: 0.8352941275, blue: 0.6000000238, alpha: 1);
        //
        //            // restore the color to the other button
        //        }
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
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
    }
    
    @IBAction func decreaseButton(_ sender: Any) {
    }
    
    @IBAction func increaseButton(_ sender: Any) {
    }
    
    @IBAction func equalButton(_ sender: Any) {
    }
}

