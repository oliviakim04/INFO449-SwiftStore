//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name : String { get }
    func price() -> Int
}

class Item : SKU {
    var name: String
    var priceEach: Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return priceEach
    }
}

class Receipt {
    var purchased : [SKU]
    
    init() {
        purchased = []
    }
    
    func items() -> [SKU] {
        return purchased
    }
    
    func formatPrice(_ cents: Int) -> String {
        let dollars = Double(cents) / 100.0
        return String(format: "$%.2f", dollars)
    }
    
    func output() -> String {
        var result = "Receipt:\n"
            
            for item in purchased {
                result += "\(item.name): \(formatPrice(item.price()))\n"
            }
            
        result += "------------------\n"
        result += "TOTAL: \(formatPrice(total()))"
        
        return result
    }
    
    func total() -> Int {
        var sum = 0
        for item in self.purchased {
            sum += item.price()
        }
        return sum
    }
}

class Register {
    var receipt : Receipt
    
    init() {
        receipt = Receipt()
    }
    
    func scan(_ sku : SKU) -> Void {
        receipt.purchased.append(sku)
    }
    
    func subtotal() -> Int {
        return receipt.total()
    }
    
    func total() -> Receipt {
        let finished = receipt
        receipt = Receipt()
        return finished
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

