import Foundation
import CoreData
import Combine

final class ProductNavigatorViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var currentIndex: Int = 0
    
    func loadProducts(context: NSManagedObjectContext) {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        request.sortDescriptors = [
            NSSortDescriptor(key: "productID", ascending: true)
        ]
        
        do {
            products = try context.fetch(request)
            
            if currentIndex >= products.count {
                currentIndex = 0
            }
            
        } catch {
            print("Error loading products: \(error.localizedDescription)")
        }
    }
    
    var currentProduct: Product? {
        guard !products.isEmpty,
              currentIndex >= 0,
              currentIndex < products.count else {
            return nil
        }
        return products[currentIndex]
    }
    
    func nextProduct() {
        guard !products.isEmpty else { return }
        currentIndex = (currentIndex + 1) % products.count
    }
    
    func previousProduct() {
        guard !products.isEmpty else { return }
        currentIndex = (currentIndex - 1 + products.count) % products.count
    }
}
