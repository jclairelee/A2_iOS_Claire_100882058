import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house.fill")
            }
            
            NavigationStack {
                ProductListView()
            }
            .tabItem {
                Label("List", systemImage: "list.bullet")
            }
            
            NavigationStack {
                ProductSearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }
            NavigationStack {
                AddProductView()
            }
            .tabItem {
                Label("Add", systemImage: "plus.circle")
            }
        }
    }
}
