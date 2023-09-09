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
        .tint(.yellow)
        .gaugeStyle(.accessoryCircularCapacity)
    }
}

//5
struct SpeedometerGaugeStyle: GaugeStyle {
    private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
 
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
 
            Circle()
                .foregroundColor(Color(.systemGray6))
 
            Circle()
                .trim(from: 0, to: 0.75 * configuration.value)
                .stroke(purpleGradient, lineWidth: 20)
                .rotationEffect(.degrees(135))
 
            Circle()
                .trim(from: 0, to: 0.75)
                .stroke(Color.black, style: StrokeStyle(lineWidth: 10, lineCap: .butt, lineJoin: .round, dash: [1, 34], dashPhase: 0.0))
                .rotationEffect(.degrees(135))
 
            VStack {
                configuration.currentValueLabel
                    .font(.system(size: 80, weight: .bold, design: .rounded))
                    .foregroundColor(.gray)
                Text("KM/H")
                    .font(.system(.body, design: .rounded))
                    .bold()
                    .foregroundColor(.gray)
            }
 
        }
        .frame(width: 300, height: 300)
 
    }
 
}

