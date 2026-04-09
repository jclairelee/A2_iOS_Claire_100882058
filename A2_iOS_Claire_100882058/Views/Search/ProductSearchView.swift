import SwiftUI
import CoreData

struct ProductSearchView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var searchText: String = ""
    @State private var results: [Product] = []
    
    var body: some View {
        NavigationView {
            VStack {
               
                HStack {
                    TextField("Search by name or description", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                    
                    Button("Search") {
                        searchProducts()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                
                // result
                if results.isEmpty {
                    Spacer()
                    Text("No results")
                        .foregroundColor(.secondary)
                    Spacer()
                } else {
                    List(results) { product in
                        VStack(alignment: .leading, spacing: 6) {
                            
                            Text(product.wrappedName)
                                .font(.headline)
                            
                            Text(product.wrappedDesc)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                            
                            Text(product.priceText)
                                .font(.caption)
                        }
                    }
                }
            }
            .navigationTitle("Search")
        }
    }
    
    private func searchProducts() {
        let request: NSFetchRequest<Product> = Product.fetchRequest()
        
        let trimmed = searchText.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if trimmed.isEmpty {
            results = []
            return
        }
        
        request.predicate = NSPredicate(
            format: "name CONTAINS[cd] %@ OR productDesc CONTAINS[cd] %@",
            trimmed,
            trimmed
        )
        
        request.sortDescriptors = [
            NSSortDescriptor(key: "productID", ascending: true)
        ]
        
        do {
            results = try viewContext.fetch(request)
        } catch {
            print("Search error: \(error.localizedDescription)")
        }
    }
}
