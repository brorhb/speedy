//
//  ContentView.swift
//  Speedy WatchKit Extension
//
//  Created by Bror Brurberg on 07/03/2020.
//  Copyright © 2020 Bror Brurberg. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var locationProvider = LocationProvider()
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(locationProvider.speed, specifier: "%.1f")\(locationProvider.speedUnit.symbol)")
                .font(Font.system(.title, design: .rounded))
                .contextMenu {
                    Button("\(UnitSpeed.metersPerSecond.symbol)") {
                        self.locationProvider.set(unit: UnitSpeed.metersPerSecond)
                    }
                    Button("\(UnitSpeed.kilometersPerHour.symbol)") {
                        self.locationProvider.set(unit: UnitSpeed.kilometersPerHour)
                    }
                    Button("\(UnitSpeed.milesPerHour.symbol)") {
                        self.locationProvider.set(unit: UnitSpeed.milesPerHour)
                    }
                    Button("\(UnitSpeed.knots.symbol)") {
                        self.locationProvider.set(unit: UnitSpeed.knots)
                    }
                }
            Spacer()
            HStack {
                Image(systemName: "location.fill")
                Text("\(locationProvider.course)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
