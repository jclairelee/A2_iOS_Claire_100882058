import SwiftUI
import CoreData

@main
struct A2_iOS_Claire_100882058App: App {
    let persistenceController = PersistenceController.shared

    init() {
        let context = persistenceController.container.viewContext
        ProductSeeder.seedIfNeeded(context: context)
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

