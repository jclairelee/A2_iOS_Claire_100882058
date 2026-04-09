import Foundation

extension Product {
    
    var wrappedName: String {
        name ?? "Unknown Product"
    }
    
    var wrappedDesc: String {
        productDesc ?? "No Description"
    }
    
    var wrappedProvider: String {
        provider ?? "Unknown Provider"
    }
    
    var priceText: String {
        String(format: "$%.2f", price)
    }
}
