

import Foundation

struct Calculator {
    
    private var accumulator: Double?
    private var pendingBinaryOperation: PendingBinaryOperation?
    
    private enum Operation {
        case constant(Double)
        case unary((Double) -> Double)
        case binary((Double,Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<OperationKind,Operation> = [
        .allClear : Operation.constant(0),
        .plusOrMinus : Operation.unary({ -$0 }),
        .percentage: Operation.unary({ $0 / 100.0 }),
        .divide : Operation.binary({ $0 / $1 }),
        .muliply : Operation.binary({ $0 * $1 }),
        .minus : Operation.binary({ $0 - $1 }),
        .plus : Operation.binary({ $0 + $1 }),
        .equal : Operation.equals,
    ]
    
    mutating func performOperation(_ symbol: OperationKind) {
        if let operation = operations[symbol] {
            switch operation {
            case .constant(let value):
                accumulator = value
            case .unary(let f):
                if accumulator != nil {
                    accumulator = f(accumulator!)
                }
            case .binary(let f):
                if accumulator != nil {
                    pendingBinaryOperation = PendingBinaryOperation(function: f, firstOperand: accumulator!)
                    accumulator = nil
                }
            case .equals:
                performPendingBinaryOperation()
            }
        } else {
            print("wrong operation symbol")
        }
    }
    
    mutating private func performPendingBinaryOperation() {
        if pendingBinaryOperation != nil && accumulator != nil {
            accumulator = pendingBinaryOperation!.perform(with: accumulator!)
            pendingBinaryOperation = nil
        }
    }
    
    private struct PendingBinaryOperation {
        let function: (Double, Double) -> Double
        let firstOperand: Double
        
        func perform(with secondOperand: Double) -> Double {
            function(firstOperand, secondOperand)
        }
    }
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    var result: Double? { get { accumulator } }
    
}
