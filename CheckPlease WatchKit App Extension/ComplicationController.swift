//
//  ComplicationController.swift
//  CheckPlease WatchKit App Extension
//
//  Created by Jake Hirzel on 7/3/16.
//  Copyright © 2016 Jake Hirzel. All rights reserved.
//

import ClockKit


class ComplicationController: NSObject {
    
    // MARK: - Placeholder Templates
    
    func getPlaceholderTemplate(for complication: CLKComplication, withHandler handler: (CLKComplicationTemplate?) -> Void) {
        // This method will be called once per supported complication, and the results will be cached
        
        var template: CLKComplicationTemplate? = nil
        switch complication.family {
        case .modularSmall:
            let modularTemplate = CLKComplicationTemplateModularSmallSimpleImage()
            modularTemplate.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Modular")!)
            template = modularTemplate
        case .modularLarge:
            template = nil
        case .utilitarianSmall:
            let utilitarianTemplate = CLKComplicationTemplateUtilitarianSmallFlat()
            utilitarianTemplate.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Utilitarian")!)
            utilitarianTemplate.textProvider = CLKSimpleTextProvider(text: "CkPls")
            template = utilitarianTemplate
        case .utilitarianLarge:
            template = nil
        case .circularSmall:
            let circularTemplate = CLKComplicationTemplateCircularSmallRingImage()
            circularTemplate.imageProvider = CLKImageProvider(onePieceImage: UIImage(named: "Complication/Circular")!)
            template = circularTemplate
        default:
            handler(nil)
        }
        handler(template)
        
    }
    
}
