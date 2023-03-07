//
//  ActivityFunctions.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 03.02.2023.
//

import UIKit

class ActivityFunctions {
    // create activity
    static func createActivity(at tripIndex: Int, for dayIndex: Int, activityTitle: String, activitySubTitle: String, activityType: Int32, coreDataStack: CoreDataStack) {
        let activityModel = ActivityModel(context: coreDataStack.managedContext)
        activityModel.title = activityTitle
        activityModel.subtitle = activitySubTitle
        activityModel.actitvityType = activityType
        let dayModel = TripsData.trips[tripIndex].dayModels?[dayIndex] as? DayModel
        dayModel?.addToActivityModels(activityModel)
        coreDataStack.saveContext()
        
    }
    
    // delete activity
    static func deleteActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel, coreDataStack: CoreDataStack) {
        let dayModel = TripsData.trips[tripIndex].dayModels?[dayIndex] as? DayModel
        dayModel?.removeFromActivityModels(activityModel)
        coreDataStack.saveContext()
    }
    
    // update activity
    static func updateActivity(at tripIndex: Int, for dayIndex: Int, using activityModel: ActivityModel, coreDataStack: CoreDataStack) {
        guard let dayModel = TripsData.trips[tripIndex].dayModels?[dayIndex] as? DayModel,
              let activityIndex = dayModel.activityModels?.index(of: activityModel) else {return}
        dayModel.replaceActivityModels(at: activityIndex, with: activityModel)
        coreDataStack.saveContext()
        
    }
    
  
    
    // reorder activity
    static func reorderActivity() {
        
    }
}
