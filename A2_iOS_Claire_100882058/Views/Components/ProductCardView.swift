import SwiftUI

struct ProductCardView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(product.wrappedName)
                .font(.title2)
                .fontWeight(.bold)
            
            Text("Product ID: \(product.productID)")
                .font(.subheadline)
            
            Text(product.wrappedDesc)
                .font(.body)
            
            Text("Price: \(product.priceText)")
                .font(.headline)
            
            Text("Provider: \(product.wrappedProvider)")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

#Preview {
    Text("Preview not available without Core Data context")
}
