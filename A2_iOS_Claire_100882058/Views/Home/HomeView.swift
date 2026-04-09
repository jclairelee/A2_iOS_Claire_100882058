import SwiftUI

struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var vm = ProductNavigatorViewModel()
    
    var body: some View {
    
            ZStack {
                Color(red: 0.98, green: 0.96, blue: 0.93)
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                    Text("Popular Products")
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
//
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
                    
                
                        NavigationLink {
                            ProductListView()
                        } label: {
                            Text("View All Products")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                        }
                        .background(Color(red: 0.55, green: 0.44, blue: 0.28))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        NavigationLink {
                            ProductSearchView()
                        } label: {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Text("Search Products")
                            }
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color(red: 0.55, green: 0.44, blue: 0.28), lineWidth: 1)
                            )
                        }
                        .foregroundColor(Color(red: 0.55, green: 0.44, blue: 0.28))
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
