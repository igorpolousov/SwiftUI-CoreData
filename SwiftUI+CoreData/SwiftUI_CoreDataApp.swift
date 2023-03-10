//
//  SwiftUI_CoreDataApp.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import SwiftUI

@main
struct SwiftUI_CoreDataApp: App {
    
    // Create Core Data stack
    let coreDataStack = CoreDataStack(modelName: "SwiftUI+CoreData")
    
    // Data for List view
    var tripsData = TripsData()
    
    var body: some Scene {
        WindowGroup {
            TripsView()
                .environmentObject(coreDataStack)
                .environmentObject(tripsData)
        }
    }
}

