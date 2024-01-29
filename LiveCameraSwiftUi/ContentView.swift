//
//  ContentView.swift
//  LiveCameraSwiftUi
//
//  Created by Mac Mini on 27/01/2024.
//
import SwiftUI
struct ContentView: View {
    @StateObject private var model = FrameHandler()
    @State private var progressValue: Float = 0.5

    var body: some View {
        ZStack {
            FrameView(image: model.frame)
                .ignoresSafeArea()

            VStack {
                Spacer() // Pushes everything to the bottom

                VStack(spacing: 5) {
                    vitalSignView(name: "HR", icon: "heart.fill", value: "100 bpm", color: .red)
                    vitalSignView(name: "HRV", icon: "waveform.path.ecg", value: "60 ms", color: .blue)
                    vitalSignView(name: "RR", icon: "lungs.fill", value: "16 br/min", color: .green)
                    vitalSignView(name: "SPO2", icon: "waveform", value: "98%", color: .purple)
                }

                // Progress Bar
                VStack {
                    ProgressView(value: progressValue, total: 1.0)
                        .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                        .scaleEffect(x: 1, y: 2, anchor: .center)
                        .frame(width: 200) // Fixed width for the progress bar
                        .padding()

                    Text("\(Int(progressValue * 100))% Complete")
                        .font(.caption)
                }
                .frame(maxWidth: .infinity) // Ensures VStack takes full width for center alignment

                Button(action: {
                    print("Scan button tapped")
                }) {
                    Text("Scan")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
            }
        }
    }

    @ViewBuilder
    private func vitalSignView(name: String, icon: String, value: String, color: Color) -> some View {
        HStack(spacing: 8) { // Reduced spacing between elements in HStack
            Text(name)
                .font(.headline)
                .fontWeight(.bold)
            Image(systemName: icon)
                .foregroundColor(color)
            Text(value)
        }
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)) // Reduced padding around HStack
    }
    

}
