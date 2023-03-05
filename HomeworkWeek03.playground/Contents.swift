import UIKit

var itemPrices: [Decimal] = [10.5, 11.33, 5.45, 6.00, 21.15, 45.21, 12.32]
let discountType: [String: Decimal] = [
    "Default": 0.05,
    "Thanksgiving": 0.10,
    "Christmas": 0.15,
    "New Year": 0.20
]


// MARK: - Assignment 1: Function

/// Applies a discount to a total amount and returns the amount after the discount
/// - Parameters:
///   - totalAmount: total amount before the discount
///   - discountPercentage: discount percentage
/// - Returns: the amount after the discount is applied
func calculateDiscount(totalAmount: Decimal, discountPercentage: Decimal) -> Decimal {
    var totalAmountAfterDiscount = totalAmount * ( 1 - discountPercentage)
    return totalAmountAfterDiscount.roundToDigit(scale: 2)
}

calculateDiscount(totalAmount: 100.0, discountPercentage: 0.10)


// MARK: - Assignment 2: Function

/// Applies a discount to a total amount and returns the amount after the discount. If no discount is provided, applies a default discount of 5%.
/// - Parameters:
///   - totalAmount: total amount before the discount
///   - discountPercentageOrDefault: discount percentage with a default value of 5%
/// - Returns: he amount after the discount is applied
func calculateDiscount(totalAmount: Decimal, discountPercentageOrDefault: Decimal = 0.05) -> Decimal {
    var totalAmountAfterDiscount = totalAmount * ( 1 - discountPercentageOrDefault)
    return totalAmountAfterDiscount.roundToDigit(scale: 2)
}

calculateDiscount(totalAmount: 100.0)


// MARK: - Assignment 3: Typealias

/// Type annotation for a function that applies a discount provided by name on the total amount
typealias ApplyDiscount = (Decimal, String) -> Decimal

/// Applies a discount provided with discount name to a total amount
/// - Parameters:
///   - totalAmount: total amount before discount
///   - discountName: discount name
/// - Returns: total amount after discount is applies
func calculateDiscount(_ totalAmount: Decimal, _ discountName: String) -> Decimal {
    let discountPercentage = discountType[discountName] ?? 0
    guard discountPercentage > 0 else { return totalAmount }
    
    return calculateDiscount(totalAmount: totalAmount, discountPercentage: discountPercentage)
}

/// Prints discounted amounts for all existing discount
/// - Parameters:
///   - totalAmount: total amount before discounts
///   - calculateDiscount: function to calculate a discount based on the discount name
func printDiscount(totalAmount: Decimal, calculateDiscount: ApplyDiscount) {
    print("Total amount discounted for all existing discounts:")
    discountType.keys
        .sorted()
        .forEach { discountName in
            let totalAmountAfterDiscount = calculateDiscount(totalAmount, discountName)
            print(NumberFormatter.currencyFormatter.string(from: totalAmountAfterDiscount as NSDecimalNumber)!, terminator: " ")
        }
    print("\n---")
}

printDiscount(totalAmount: 100.0, calculateDiscount: calculateDiscount)


// MARK: - Assignment 4: Closure

/// A closure that calculates discounted amount on a given total amount and a discount type
/// - Parameters:
///   - totalAmount: total amount before discounts
///   - discountType: enum DiscountType -> see assignment 7
/// - Returns: total amount after discount is applies
let calculateDiscount: (Decimal, DiscountType) -> Decimal  = { totalAmount, discountType in
    let discountedAmount = totalAmount * discountType.discountRate
    var totalAmountAfterDiscount = totalAmount - discountedAmount
    
    return totalAmountAfterDiscount.roundToDigit(scale: 2)
}

let calculateDiscount1: (Decimal, DiscountType) -> Decimal  = {
    var totalAmountAfterDiscount = $0 * (1 - $1.discountRate)
    
    return totalAmountAfterDiscount.roundToDigit(scale: 2)
}


calculateDiscount(100.25, .default)
calculateDiscount1(100.25, .default)

// MARK: - Assignment 5: Map

/// Increase all items' prices with a given percentage and print them
/// - Parameters:
///   - itemPrices: an array of existing items' prices
///   - percentIncrease: a percentage to increase the prices
/// - Returns: total amount after discount is applies
func increasePrices(itemPrices: inout [Decimal], percentIncrease: Decimal) {
    print("Increased all items' prices by \(percentIncrease)%:")
    itemPrices
        .map {
            var increasedPrice = $0 * (1 + percentIncrease)
            return increasedPrice.roundToDigit(scale: 2)
        }
        .forEach{
            print(NumberFormatter.currencyFormatter.string(from: $0 as NSDecimalNumber)!, terminator: " ")
        }
    print("\n---")
}

increasePrices(itemPrices: &itemPrices, percentIncrease: 0.5)


// MARK: Assignment 6: Sorted

/// Sorts a dictionary with all discount names and values in a decinding order
/// - Parameter discountType: dictionary with all discounts' names and values
/// - Returns: An array of named tupples with discount name as key and discount percentage as value
func sortDiscounts(discountType: [String: Decimal]) -> Any {
    return Array(discountType.sorted(by: { $0.value > $1.value }))
}

let sortedDiscounts = sortDiscounts(discountType: discountType)
print("All Discounts sorted descending:\n",sortedDiscounts, "\n---")


// MARK: - Assignment 7: Enums and Switch Cases

/// Enum with all types of dicounts' names and percetages
enum DiscountType: String, CaseIterable {
    case `default` = "Default"
    case tanksgiving = "Thanksgiving"
    case christmas = "Christmas"
    case newYear = "New Year"
    
    var discountRate: Decimal {
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

/// Prints a discount name and percentage
/// - Parameter discountType: DiscountType enum
func printDiscount(discountType: DiscountType) {
    print("\(discountType.rawValue) discount: \(discountType.discountRate * 100)%\n---")
}

/// Prints all discount names and values
func printDiscount() {
    DiscountType.allCases.forEach {
        print("\($0.rawValue) discount: \($0.discountRate * 100)%")
    }
}

printDiscount(discountType: .christmas)
printDiscount()


// MARK: - Assignment 8: Computed Property

/// Shopping cart data model
struct Checkout {
    var itemPrices: [Decimal] = [10.0, 20.0, 30.0]
    var currentDiscount = DiscountType.christmas
    
    var totalAmount: Decimal {
        return itemPrices.reduce(0.0, +)
    }
    
    
    /// Assigment 8: Computed property
    var currentDiscountedAmount: Decimal {
        return itemPrices.reduce(0.0) { partialResult, itemPrice in
            partialResult + itemPrice * (1 - currentDiscount.discountRate)
        }
    }
    
    /// Assigment 9: Lazy  property
    lazy var maxDiscount: Decimal? = {
        return DiscountType.allCases
            .map({ $0.discountRate })
            .max()
    }()
    
    /// Assigment 10: Method
    func getTotalAmountAfterDiscount(discountType: DiscountType) -> Decimal {
        var totalAmountAfterApplyingDiscount = totalAmount * (1 - discountType.discountRate)
        return totalAmountAfterApplyingDiscount.roundToDigit(scale: 2)
    }
}

var checkout = Checkout()
checkout.totalAmount
checkout.currentDiscountedAmount
checkout.maxDiscount
checkout.getTotalAmountAfterDiscount(discountType: .newYear)


// MARK: Assignment 11: Protocol

/// Discount protocol requiring discountType as DiscountType enum, discount percentage and method to apply the discount on given total amount
protocol Discount {
    var discountType: DiscountType { get }
    var dicountPercentage: Decimal { get }
    
    init(discountType: DiscountType)
    
    func calculateDiscount(totalAmount: Decimal) -> Decimal
}

/// A class implementing the Discount protocol
class CurrentDiscount: Discount {
    let discountType: DiscountType
    let dicountPercentage: Decimal
    
    required init(discountType: DiscountType) {
        self.discountType = discountType
        self.dicountPercentage = discountType.discountRate
    }
    
    func calculateDiscount(totalAmount: Decimal) -> Decimal {
        var totalAmountAfterApplyingDiscount = totalAmount * (1 - dicountPercentage)
        return totalAmountAfterApplyingDiscount.roundToDigit(scale: 2)
    }
}


//MARK: - Assignment 12: Extension

/// Extenion of the Shopping cart struct that rounds the total discounted amount
extension Checkout {
    var roundedTotalDiscountedAmount: Decimal {
        var roundedTotalDiscountedAmount: Decimal = 0
        var currentTotalAmount = self.totalAmount
        NSDecimalRound(&roundedTotalDiscountedAmount, &currentTotalAmount, 0, NSDecimalNumber.RoundingMode.plain)
        return roundedTotalDiscountedAmount
    }
}

checkout.itemPrices = [50.5]
checkout.roundedTotalDiscountedAmount

checkout.itemPrices = [50.4]
checkout.roundedTotalDiscountedAmount


// MARK: - Extensions

extension Decimal {
    mutating func roundToDigit(scale: Int) -> Decimal {
        var roundedAmount: Decimal = 0
        NSDecimalRound(&roundedAmount, &self, scale, NSDecimalNumber.RoundingMode.plain)
        return roundedAmount
    }
}

extension NumberFormatter {
    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "us_US")
        return formatter
    }
}
