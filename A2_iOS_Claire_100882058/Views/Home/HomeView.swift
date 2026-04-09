import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var vm = ProductNavigatorViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 0.98, green: 0.96, blue: 0.93)
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Text("Featured Products")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(Color(red: 0.55, green: 0.44, blue: 0.28))
//                    Product card
                    if let product = vm.currentProduct {
                        ProductCardView(product: product)
                    } else {
                        Text("No products available")
                            .foregroundColor(.secondary)
                    }
//                    Navigation buttons
                    HStack(spacing: 20) {
                        Button("Previous") {
                            vm.previousProduct()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.55, green: 0.44, blue: 0.28))
                        
                        Button("Next") {
                            vm.nextProduct()
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.55, green: 0.44, blue: 0.28))
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Home")
            .onAppear {
                vm.loadProducts(context: viewContext)
            }
        }
    }
}
