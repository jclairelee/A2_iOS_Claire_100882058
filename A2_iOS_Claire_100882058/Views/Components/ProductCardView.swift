import SwiftUI

struct ProductCardView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text(product.wrappedName)
                .font(.title2)
                .fontWeight(.semibold)
            
            Divider()
            
            Text(product.wrappedDesc)
                .font(.body)
                .foregroundColor(.secondary)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Price")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(product.priceText)
                        .font(.headline)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 6) {
                    Text("Provider")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(product.wrappedProvider)
                        .font(.subheadline)
                }
            }
            
            Text("ID: \(product.productID)")
                .font(.caption2)
                .foregroundColor(.gray)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(.systemBackground))
                .shadow(color: Color.black.opacity(0.08), radius: 8, x: 0, y: 4)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color(.systemGray5), lineWidth: 1)
        )
        .padding(.horizontal)
    }
}
