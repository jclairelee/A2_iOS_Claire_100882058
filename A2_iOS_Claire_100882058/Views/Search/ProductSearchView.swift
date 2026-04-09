import SwiftUI
import CoreData

struct ProductSearchView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @State private var searchText: String = ""
    @State private var results: [Product] = []
    
    let suggestions = ["Apple", "laptop", "wireless", "phone", "Samsung"]
    
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
                    .tint(Color(red: 0.55, green: 0.44, blue: 0.28))
                }
                .padding()
                
                // Suggestions
                if searchText.isEmpty {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(suggestions, id: \.self) { keyword in
                                Button {
                                    searchText = keyword
                                    searchProducts()
                                } label: {
                                    Text(keyword)
                                        .font(.subheadline)
                                             .lineLimit(1)
                                             .truncationMode(.tail)
                                             .frame(maxWidth: 120)
                                             .padding(.horizontal, 12)
                                             .padding(.vertical, 8)
                                             .background(Color(red: 0.55, green: 0.44, blue: 0.28).opacity(0.15))
                                             .foregroundColor(Color(red: 0.55, green: 0.44, blue: 0.28))
                                             .cornerRadius(20)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                
                // result
                if results.isEmpty && !searchText.isEmpty {
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
                        .listRowBackground(Color.white)
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden)
                }
            }
            .background(Color(red: 0.98, green: 0.96, blue: 0.93))
            .onChange(of: searchText) {
                    searchProducts()
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
