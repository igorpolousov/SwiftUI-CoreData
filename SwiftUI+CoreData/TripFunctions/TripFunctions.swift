//
//  TripFunctions.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import UIKit
import CoreData

class TripFunctions {
    
    // create trip
    static func createTrip(tripModelTitle: String, tripModelImage: UIImage? = nil, coreDataStack: CoreDataStack) {
        let tripModel = TripModel(context: coreDataStack.managedContext)
        tripModel.title = tripModelTitle
        tripModel.image = tripModelImage?.pngData()
        tripModel.id = UUID()
        TripsData.trips.append(tripModel)
        coreDataStack.saveContext()
    }
    
    // read trip form core data
    static func readTrips(coreDataStack: CoreDataStack) {
        let fetchRequest: NSFetchRequest<TripModel> = TripModel.fetchRequest()
        var asyncFetchRequest: NSAsynchronousFetchRequest<TripModel>?
        asyncFetchRequest = NSAsynchronousFetchRequest<TripModel>(fetchRequest: fetchRequest) {
            (result: NSAsynchronousFetchResult) in
            guard let tripData = result.finalResult else {return}
            TripsData.trips = tripData
        }
        
        do {
            guard let asyncFetchRequest = asyncFetchRequest else {return}
            try coreDataStack.managedContext.execute(asyncFetchRequest)
        } catch let error as NSError {
            print("Unalble to load data \(error), \(error.localizedDescription)")
        }
    }
    
    // get trip data by trip id
    static func readTrip() {
        
    }
    
    // update trip data
    static func updateTrip() {
        
    }
    
    // delete trip
    static func deleteTrip() {
        
    }
    
}
