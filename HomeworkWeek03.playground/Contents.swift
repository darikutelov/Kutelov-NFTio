import UIKit


var itemPrices: [Decimal] = [10.5, 11.33, 5.45, 6.00, 21.15, 45.21, 12.32]
var totalAmount: Decimal
var discountPercentage: Float

let discountType: [String: Float] = [
    "Default": 0.05,
    "Thanksgiving": 0.10,
    "Christmas": 0.15,
    "New Year": 0.20
]

var discountedAmount: Decimal
var totalAmountAfterDiscount: Decimal


// MARK: - Assignment 1

/// Applies a discount to a total amount and returns the amount after the discount
/// - Parameters:
///   - totalAmount: total amount before the discount
///   - discountPercentage: discount percentage
/// - Returns: the amount after the discount is applied
func calculateDiscount(totalAmount: Decimal, discountPercentage: Float) -> Decimal {
    let discountedAmount = totalAmount * NSNumber(value: discountPercentage).decimalValue
    var totalAmountAfterDiscount = totalAmount - discountedAmount
    return totalAmountAfterDiscount.roundToDigit(scale: 2)
}


totalAmount = itemPrices[0]
discountPercentage = discountType["Default"] ?? 0.0
totalAmountAfterDiscount = calculateDiscount(totalAmount: totalAmount, discountPercentage: discountPercentage)



// MARK: - Assignment 2

/// Applies a discount to a total amount and returns the amount after the discount. If no discount is provided, applies a default discount of 5%.
/// - Parameters:
///   - totalAmount: total amount before the discount
///   - discountPercentageOrDefault: discount percentage with a default value of 5%
/// - Returns: he amount after the discount is applied
func calculateDiscount(totalAmount: Decimal, discountPercentageOrDefault: Float = 0.05) -> Decimal {
    let discountedAmount = totalAmount * NSNumber(value: discountPercentageOrDefault).decimalValue
    var totalAmountAfterDiscount = totalAmount - discountedAmount
    return totalAmountAfterDiscount.roundToDigit(scale: 2)
}

totalAmount = itemPrices[0]
totalAmountAfterDiscount = calculateDiscount(totalAmount: totalAmount)



// MARK: - Assignment 3

/// Type annotation for a function that applies a discount provided by name on the total amount
typealias ApplyDiscount = (Decimal, String) -> Decimal

/// Applies a discount provided with discount name to a total amount
/// - Parameters:
///   - totalAmount: total amount before discount
///   - discountName: discount name
/// - Returns: total amount after discount is applies
func calculateADiscount(totalAmount: Decimal, discountName: String) -> Decimal {
    let discountPercentage = discountType[discountName] ?? 0
    guard discountPercentage > 0 else { return totalAmount }
    
    return calculateDiscount(totalAmount: totalAmount, discountPercentage: discountPercentage)
}

/// Prints discounted amounts for all existing discount
/// - Parameters:
///   - totalAmount: total amount before discounts
///   - calculateDiscount: function to calculate a discount based on the discount name
func printDiscount(totalAmount: Decimal, calculateDiscount: ApplyDiscount) {
    discountType.keys
        .sorted()
        .forEach { discountName in
            let totalAmountAfterDiscount = calculateDiscount(totalAmount,discountName)
            print(NumberFormatter.currencyFormatter.string(from: totalAmountAfterDiscount as NSDecimalNumber)!)
        }
}

printDiscount(totalAmount: 100.0, calculateDiscount: calculateADiscount)


// MARK: - Assignment 4: Closure

let calculateDiscount: ApplyDiscount = { totalAmount, discountName in
    let discountPercentage = discountType[discountName] ?? 0
    
    guard discountPercentage > 0 else { return totalAmount }
    
    let discountedAmount = totalAmount * NSNumber(value: discountPercentage).decimalValue
    var totalAmountAfterDiscount = totalAmount - discountedAmount
    
    return totalAmountAfterDiscount.roundToDigit(scale: 2)
}


calculateDiscount(100.25, "Default")

// MARK: - Assignment 5: Map

func increasePrices(itemPrices: inout [Decimal], percentIncrease: Decimal) {
    itemPrices
        .map {
            var increasedPrice = $0 * (1 + percentIncrease)
            return increasedPrice.roundToDigit(scale: 2)
        }
        .forEach{ print(NumberFormatter.currencyFormatter.string(from: $0 as NSDecimalNumber)!) }
}

increasePrices(itemPrices: &itemPrices, percentIncrease: 0.5)


// MARK: Assignment 6: Sorted

typealias DiscountTypes = [String: Float]

func sortDiscounts(discountTypes: DiscountTypes) -> [DiscountTypes.Element] {
    return discountTypes.sorted(by: { $0.value > $1.value } )
}
let sortedDiscounts = sortDiscounts(discountTypes: discountType)
print(sortedDiscounts)


// MARK: - Assignment 7: Enums and Switch Cases
enum DiscountType: String, CaseIterable {
    case `default` = "Default"
    case tanksgiving = "Thanksgiving"
    case christmas = "Christmas"
    case newYear = "New Year"
    
    var discountRate: Double {
        switch self {
        case .default:
            return 0.05
        case .tanksgiving:
            return 0.10
        case .christmas:
            return 0.15
        case .newYear:
            return 0.20
        }
    }
}

func printDiscount(discountType: DiscountType) {
    print(discountType.discountRate)
}

printDiscount(discountType: .christmas)


// MARK: - Assignment 8: Computed Property

struct ShoppingCart {
    var itemPrices: [Decimal] = [10.5, 12.25, 14.0]
    var currentDiscount = DiscountType.christmas
    
    var totalAmount: Decimal {
        return itemPrices.reduce(0.0) { partialResult, itemPrice in
            partialResult + itemPrice
        }
    }
    
    lazy var maxDiscount: Double? = {
        let maxDiscount = DiscountType.allCases.max(by: { $0.discountRate < $1.discountRate})
        
        return maxDiscount?.discountRate
    }()
    
    var currentDiscountedAmount: Decimal {
        return itemPrices.reduce(0.0) { partialResult, itemPrice in
            partialResult + itemPrice * NSNumber(value: 1 - currentDiscount.discountRate).decimalValue
        }
    }
    
    func getTotalAmountAfterApplyingDiscount(discountType: DiscountType) -> Decimal {
        var totalAmountAfterApplyingDiscount = totalAmount * NSNumber(value: 1 - currentDiscount.discountRate).decimalValue
        return totalAmountAfterApplyingDiscount.roundToDigit(scale: 2)
    }
}

var shoppingCart = ShoppingCart()
shoppingCart.currentDiscountedAmount
shoppingCart.maxDiscount
shoppingCart.getTotalAmountAfterApplyingDiscount(discountType: .newYear)


// MARK: Assignment 11: Protocol

protocol Discount {
    var discountType: DiscountType { get set }
    var dicountPercentage: Double { get set }
    func calculateDiscount(totalAmount: Decimal) -> Decimal
}

class CurrentDiscount: Discount {
    var discountType: DiscountType
    
    var dicountPercentage: Double
    
    init(discountType: DiscountType) {
        self.discountType = discountType
        self.dicountPercentage = discountType.discountRate
    }
    
    func calculateDiscount(totalAmount: Decimal) -> Decimal {
        var totalAmountAfterApplyingDiscount = totalAmount * NSNumber(value: 1 - discountType.discountRate).decimalValue
        
        return totalAmountAfterApplyingDiscount.roundToDigit(scale: 2)
    }
}


//MARK: - Assignment 12: Extension

extension ShoppingCart {
    
    var roundedTotalDiscountedAmount: Decimal {
        var totalAmount = self.totalAmount
        return totalAmount.roundToDigit(scale: 0)
    }
}


extension Decimal {
    mutating func roundToDigit(scale: Int) -> Decimal {
        var roundedAmount: Decimal = 0
        NSDecimalRound(&roundedAmount, &self, scale, NSDecimalNumber.RoundingMode.plain)
        return roundedAmount
    }
}

shoppingCart.itemPrices = [50.5]
shoppingCart.roundedTotalDiscountedAmount

shoppingCart.itemPrices = [50.4]
shoppingCart.roundedTotalDiscountedAmount


extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            formatter.locale = Locale(identifier: "us_US")
            return formatter
    }
}
