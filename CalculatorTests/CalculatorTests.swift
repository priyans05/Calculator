

import XCTest
@testable import Calculator

class CalculatorTests: XCTestCase {
    
    var calculator: Calculator!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        calculator = Calculator()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSignChange() {
        calculator.setOperand(11)
        calculator.performOperation(OperationKind.plusOrMinus)
        XCTAssert(calculator.result == -11)
    }
    
    func testAllClear() {
        calculator.setOperand(3)
        calculator.performOperation(OperationKind.plusOrMinus)
        calculator.performOperation(OperationKind.allClear)
        XCTAssert(calculator.result == 0)
    }
    
    func testPercentage() {
        calculator.setOperand(40)
        calculator.performOperation(OperationKind.percentage)
        XCTAssert(calculator.result == 0.4)
    }
    
    func testDivideAndEqual() {
        calculator.setOperand(40)
        calculator.performOperation(OperationKind.divide)
        calculator.setOperand(5)
        calculator.performOperation(.equal)
        XCTAssert(calculator.result == 8)
    }
    
    func testMultiplyAndEqual() {
        calculator.setOperand(4)
        calculator.performOperation(.muliply)
        calculator.setOperand(5)
        calculator.performOperation(.equal)
        XCTAssert(calculator.result == 20)
    }
    
    func testMultiplyAndEqualForDouble() {
        calculator.setOperand(4.3)
        calculator.performOperation(.muliply)
        calculator.setOperand(5)
        calculator.performOperation(.equal)
        XCTAssert(calculator.result == 21.5)
    }
    
    func testMinusAndEqual() {
        calculator.setOperand(-40)
        calculator.performOperation(.minus)
        calculator.setOperand(-5)
        calculator.performOperation(.equal)
        XCTAssert(calculator.result == -35)
    }
    
    func testPlusAndEqual() {
        calculator.setOperand(-40)
        calculator.performOperation(.plus)
        calculator.setOperand(-5)
        calculator.performOperation(.equal)
        XCTAssert(calculator.result == -45)
    }
    
}
