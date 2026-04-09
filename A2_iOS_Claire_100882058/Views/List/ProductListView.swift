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
        VStack(alignment: .leading, spacing: 0) {
            
            Text("All Products")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.55, green: 0.44, blue: 0.28))
                .padding(.horizontal)
                .padding(.top, 8)
                .padding(.bottom, 12)
            
            List {
                ForEach(products) { product in
                    VStack(alignment: .leading, spacing: 6) {
                        Text(product.wrappedName)
                            .font(.headline)
                            .foregroundColor(.primary)
                        
                        Text(product.wrappedDesc)
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 8)
                    .listRowBackground(Color.white)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
            .background(Color(red: 0.98, green: 0.96, blue: 0.93))
        }
        .background(Color(red: 0.98, green: 0.96, blue: 0.93))
    }
}
