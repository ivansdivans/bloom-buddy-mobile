//
//  HouseholdEditConfigurationView.swift
//  BloomBuddyMobile
//
//  Created by Daan Brocatus on 14/03/2024.
//

import SwiftUI

struct HouseholdEditConfigurationView: View {
    @Binding var configuration: HouseholdConfiguration
    private var airQualityProxy: Binding<Double> {
        Binding<Double>(get: {
            return Double(configuration.airQuality)
        }, set: {
            configuration.airQuality = Int($0)
        })
    }
    private var humidityProxy: Binding<Double> {
        Binding<Double>(get: {
            return Double(configuration.humidity)
        }, set: {
            configuration.humidity = Int($0)
        })
    }
    private var temperatureProxy: Binding<Double> {
        Binding<Double>(get: {
            return Double(configuration.averageTemperature)
        }, set: {
            configuration.averageTemperature = Int($0)
        })
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Sunlight:")
                    .fontWeight(.bold)
                Spacer()
                Picker("Select level of sunlight", selection: $configuration.sunlight) {
                    ForEach(SunlightLevel.allCases, id: \.self) { option in
                        Text(option.displayText).tag(option)
                    }
                }
                .pickerStyle(MenuPickerStyle())
            }.padding(.vertical)
            VStack {
                HStack {
                    Text("Air quality: \(configuration.airQuality) (AQI)")
                        .fontWeight(.bold)
                    Spacer()
                }
                Slider(value: airQualityProxy, in: 0...500, step: 1)
            }.padding(.vertical)
            VStack {
                HStack {
                    Text("Humidity: \(configuration.humidity)%")
                        .fontWeight(.bold)
                    Spacer()
                }
                Slider(value: humidityProxy, in: 0...100, step: 1)
            }.padding(.vertical)
            VStack {
                HStack {
                    Text("Average temperature: \(configuration.averageTemperature)C")
                        .fontWeight(.bold)
                    Spacer()
                }
                Slider(value: temperatureProxy, in: 10...40, step: 1)
            }.padding(.vertical)
        }
    }
}
