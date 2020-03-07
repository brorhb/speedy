//
//  ComplicationController.swift
//  Speedy WatchKit Extension
//
//  Created by Bror Brurberg on 07/03/2020.
//  Copyright © 2020 Bror Brurberg. All rights reserved.
//

import ClockKit


class ComplicationController: LocationProvider, CLKComplicationDataSource {
    
    // MARK: - Timeline Configuration
    
    func getSupportedTimeTravelDirections(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void) {
        handler([.forward, .backward])
    }
    
    func getTimelineStartDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getTimelineEndDate(for complication: CLKComplication, withHandler handler: @escaping (Date?) -> Void) {
        handler(nil)
    }
    
    func getPrivacyBehavior(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void) {
        handler(.showOnLockScreen)
    }
    
    // MARK: - Timeline Population
    
    func getCurrentTimelineEntry(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void) {
        // Call the handler with the current timeline entry
        let date = Date()
        var template = CLKComplicationTemplate()
        let speed = "open"
        let course = "speedy"
        switch complication.family {
        case .circularSmall:
            let t = CLKComplicationTemplateCircularSmallStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .graphicCircular:
            let t = CLKComplicationTemplateGraphicCircularStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .graphicCorner:
            let t = CLKComplicationTemplateGraphicCornerStackText()
            t.outerTextProvider = CLKSimpleTextProvider(text: speed)
            t.innerTextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .modularSmall:
            let t = CLKComplicationTemplateModularSmallStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .utilitarianSmall:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.textProvider = CLKSimpleTextProvider(text: speed)
            template = t
        case .utilitarianSmallFlat:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.textProvider = CLKSimpleTextProvider(text: speed)
            template = t
        default:
            handler(nil)
            return
        }
        let entry = CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
        handler(entry)
    }

    
    func getTimelineEntries(for complication: CLKComplication, before date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        var template = CLKComplicationTemplate()
        let speed = "open"
        let course = "speedy"
        switch complication.family {
        case .circularSmall:
            let t = CLKComplicationTemplateCircularSmallStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .graphicCircular:
            let t = CLKComplicationTemplateGraphicCircularStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .graphicCorner:
            let t = CLKComplicationTemplateGraphicCornerStackText()
            t.outerTextProvider = CLKSimpleTextProvider(text: speed)
            t.innerTextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .modularSmall:
            let t = CLKComplicationTemplateModularSmallStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .utilitarianSmall:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.textProvider = CLKSimpleTextProvider(text: speed)
            template = t
        case .utilitarianSmallFlat:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.textProvider = CLKSimpleTextProvider(text: speed)
            template = t
        default:
            handler(nil)
            return
        }
        let entry = CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
        handler([entry])
    }
    
    func getTimelineEntries(for complication: CLKComplication, after date: Date, limit: Int, withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void) {
        // Call the handler with the timeline entries after to the given date
        var template = CLKComplicationTemplate()
        let speed = "open"
        let course = "speedy"
        switch complication.family {
        case .circularSmall:
            let t = CLKComplicationTemplateCircularSmallStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .graphicCircular:
            let t = CLKComplicationTemplateGraphicCircularStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .graphicCorner:
            let t = CLKComplicationTemplateGraphicCornerStackText()
            t.outerTextProvider = CLKSimpleTextProvider(text: speed)
            t.innerTextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .modularSmall:
            let t = CLKComplicationTemplateModularSmallStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .utilitarianSmall:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.textProvider = CLKSimpleTextProvider(text: speed)
            template = t
        case .utilitarianSmallFlat:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.textProvider = CLKSimpleTextProvider(text: speed)
            template = t
        default:
            handler(nil)
            return
        }
        let entry = CLKComplicationTimelineEntry(date: date, complicationTemplate: template)
        handler([entry])
    }
    
    // MARK: - Placeholder Templates
    
    func getLocalizableSampleTemplate(for complication: CLKComplication, withHandler handler: @escaping (CLKComplicationTemplate?) -> Void) {
        var template = CLKComplicationTemplate()
        let speed = "open"
        let course = "speedy"
        switch complication.family {
        case .circularSmall:
            let t = CLKComplicationTemplateCircularSmallStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .graphicCircular:
            let t = CLKComplicationTemplateGraphicCircularStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .graphicCorner:
            let t = CLKComplicationTemplateGraphicCornerStackText()
            t.outerTextProvider = CLKSimpleTextProvider(text: speed)
            t.innerTextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .modularSmall:
            let t = CLKComplicationTemplateModularSmallStackText()
            t.line1TextProvider = CLKSimpleTextProvider(text: speed)
            t.line2TextProvider = CLKSimpleTextProvider(text: course)
            template = t
        case .utilitarianSmall:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.textProvider = CLKSimpleTextProvider(text: speed)
            template = t
        case .utilitarianSmallFlat:
            let t = CLKComplicationTemplateUtilitarianSmallFlat()
            t.textProvider = CLKSimpleTextProvider(text: speed)
            template = t
        default:
            handler(nil)
            return
        }
        handler(template)
    }
    
}
