import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var vm = ProductNavigatorViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                Text("Product Viewer")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            
                if let product = vm.currentProduct {
                    ProductCardView(product: product)
                } else {
                    Text("No products available")
                        .foregroundColor(.secondary)
                }
                
                HStack(spacing: 20) {
                    Button("Previous") {
                        vm.previousProduct()
                    }
                    .buttonStyle(.borderedProminent)
                    
                    Button("Next") {
                        vm.nextProduct()
                    }
                    .buttonStyle(.borderedProminent)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Home")
            .onAppear {
                vm.loadProducts(context: viewContext)
            }
        }
    }
}
