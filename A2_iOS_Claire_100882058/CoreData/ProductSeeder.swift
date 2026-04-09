import Foundation
import CoreData

struct ProductSeeder {
    static func seedIfNeeded(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.fetchLimit = 1

        do {
            let count = try context.count(for: request)
            if count > 0 {
                return
            }

            let products: [(Int64, String, String, Double, String)] = [
                (1, "iPhone 15", "Apple smartphone with powerful camera and performance.", 999.99, "Apple"),
                (2, "Galaxy S24", "Samsung smartphone with bright display and strong battery.", 899.99, "Samsung"),
                (3, "MacBook Air", "Lightweight laptop for students and professionals.", 1299.99, "Apple"),
                (4, "iPad Air", "Portable tablet for study, notes, and media.", 799.99, "Apple"),
                (5, "AirPods Pro", "Wireless earbuds with noise cancellation.", 329.99, "Apple"),
                (6, "Dell XPS 13", "Compact premium laptop with sharp display.", 1399.99, "Dell"),
                (7, "Sony WH-1000XM5", "Wireless headphones with excellent sound quality.", 449.99, "Sony"),
                (8, "Apple Watch", "Smartwatch for fitness and notifications.", 499.99, "Apple"),
                (9, "Google Pixel 8", "Android phone with clean software and great camera.", 799.99, "Google"),
                (10, "Logitech MX Master 3S", "Ergonomic wireless mouse for productivity.", 129.99, "Logitech")
            ]

            for item in products {
                let product = Product(context: context)
                product.productID = item.0
                product.name = item.1
                product.productDesc = item.2
                product.price = item.3
                product.provider = item.4
            }

            try context.save()
        } catch {
            print("Seeding error: \(error.localizedDescription)")
        }
    }
}
