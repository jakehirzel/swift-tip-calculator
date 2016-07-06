//
//  ComplicationController.swift
//  CheckPlease WatchKit App Extension
//
//  Created by Jake Hirzel on 7/3/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirectionsForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.Forward, .Backward])
    }
    
    func getTimelineStartDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDateForComplication(complication: CLKComplication, withHandler handler: (NSDate?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehaviorForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.ShowOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntryForComplication(complication: CLKComplication, withHandler handler: ((CLKComplicationTimelineEntry?) -> Void)) {
        // Call the handler with the current timeline entry
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, beforeDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries prior to the given date
        handler(nil)
    }
    
    func getTimelineEntriesForComplication(complication: CLKComplication, afterDate date: NSDate, limit: Int, withHandler handler: (([CLKComplicationTimelineEntry]?) -> Void)) {
        // Call the handler with the timeline entries after to the given date
        handler(nil)
    }
    
    // MARK: - Update Scheduling
    
    func getNextRequestedUpdateDateWithHandler(handler: (NSDate?) -> Void) {
        // Call the handler with the date when you would next like to be given the opportunity to update your complication content
        handler(nil);
    }
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplateForComplication(complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        
        var template: CLKComplicationTemplate? = nil
        switch complication.family {
        case .ModularSmall:
            let modularTemplate = CLKComplicationTemplateModularSmallSimpleImage()
            modularTemplate.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Modular")!)
            template = modularTemplate
        case .ModularLarge:
            template = nil
        case .UtilitarianSmall:
            let utilitarianTemplate = CLKComplicationTemplateUtilitarianSmallFlat()
            utilitarianTemplate.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Utilitarian")!)
            utilitarianTemplate.textProvider = CLKSimpleTextProvider(text: "CkPls")
            template = utilitarianTemplate
        case .UtilitarianLarge:
            template = nil
        case .CircularSmall:
            let circularTemplate = CLKComplicationTemplateCircularSmallRingImage()
            circularTemplate.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            template = circularTemplate
        }
        handler(template)
        
    }
    
}
