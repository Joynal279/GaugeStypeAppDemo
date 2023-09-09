//
//  ContentView.swift
//  GaugeStypeAppDemo
//
//  Created by Joynal Abedin on 9/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(content: {
            CustomImageView()
                .padding()
        })
    }
}

#Preview {
    ContentView()
}


//1
struct ContentView1: View {
    @State private var progress = 0.7
    var body: some View {
        Gauge(value: progress) {
            Text("Upload Status")
        }
    }
}

//2
struct ContentView2: View {
    
    @State private var progress = 0.7
    
    var body: some View{
        Gauge(value: progress) {
            Text("Upload Status")
        } currentValueLabel: {
            Text(progress.formatted(.percent))
        } minimumValueLabel: {
            Text(0.formatted(.percent))
        } maximumValueLabel: {
            Text(100.formatted(.percent))
        }
        .padding()
    }
}

//3
struct SpeedoMeterView: View {
    
    @State private var currentSpeed = 100.0
    
    var body: some View {
        Gauge(value: currentSpeed, in: 0...200) {
            Text("Speed")
        } currentValueLabel: {
            Text("\(currentSpeed.formatted(.number))km/h")
        } minimumValueLabel: {
            Text(0.formatted(.number))
        }maximumValueLabel: {
            Text(200.formatted(.number))
        }
    }
}

//4
struct CustomImageView: View {
    
    @State private var currentSpeed = 100.0
    
    var body: some View {
        Gauge(value: currentSpeed, in: 0...200) {
            Image(systemName: "gauge.medium")
                .font(.system(size: 50))
        }currentValueLabel: {
            HStack(content: {
                Image(systemName: "gauge.high")
                Text("\(currentSpeed.formatted(.number))km/h")
            })
        }minimumValueLabel: {
            Text(0.formatted(.number))
        }maximumValueLabel: {
            Text(200.formatted(.number))
        }
    }
}
