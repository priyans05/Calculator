

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    private var calculator = Calculator()
    
    var displayValue: Double {
        get {return display.text == nil ? 0 : (Double(display.text!) != nil) ? Double(display.text!)! : 0}
        set { display.text = (Int(exactly: newValue) != nil) ? String(Int(newValue)) : String(newValue)}
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        buttons.forEach { $0.layer.cornerRadius = $0.bounds.height * 0.5}
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        guard let digit = sender.currentTitle else {return}
        if userIsInTheMiddleOfTyping, let textCurrentlyInDisplay = display.text {
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
            userIsInTheMiddleOfTyping = true
        }
    }
    
    
    
    @IBAction func operationButtonClicked(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            calculator.setOperand(displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let operation = OperationKind(rawValue: sender.tag) {
            calculator.performOperation(operation)
        }
        if let result = calculator.result {
            displayValue = result
        }
    }
 
}



