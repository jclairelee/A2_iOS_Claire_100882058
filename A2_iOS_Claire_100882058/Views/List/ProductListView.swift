import SwiftUI

struct ProductListView: View {
    
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Product.productID, ascending: true)
        ],
        animation: .default
    )
    private var products: FetchedResults<Product>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(products) { product in
                    VStack(alignment: .leading, spacing: 6) {
                        
                        Text(product.wrappedName)
                            .font(.headline)
                        
                        Text(product.wrappedDesc)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 6)
                }
            }
            .navigationTitle("All Products")
            .listStyle(.insetGrouped)
        }
    }
}
