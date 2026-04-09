import SwiftUI
import CoreData

@main
struct A2_iOS_Claire_100882058App: App {
    let persistenceController = PersistenceController.shared

    init() {
        let context = persistenceController.container.viewContext
        ProductSeeder.seedIfNeeded(context: context)
//        Navigation title color
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(
                red: 0.98, green: 0.96, blue: 0.93, alpha: 1
            )
            
            appearance.titleTextAttributes = [
                .foregroundColor: UIColor(
                    red: 0.55, green: 0.44, blue: 0.28, alpha: 1
                )
            ]
            
            appearance.largeTitleTextAttributes = [
                .foregroundColor: UIColor(
                    red: 0.55, green: 0.44, blue: 0.28, alpha: 1
                )
            ]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
