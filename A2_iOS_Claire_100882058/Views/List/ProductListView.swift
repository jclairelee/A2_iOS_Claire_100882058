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
                    .listRowBackground(Color.white)
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background(Color(red: 0.98, green: 0.96, blue: 0.93))
            .navigationTitle("All Products")
            
        }
    }
}
