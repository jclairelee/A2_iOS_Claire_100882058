import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            ProductListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
            ProductSearchView()
                 .tabItem {
                     Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}
