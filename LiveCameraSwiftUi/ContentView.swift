//
//  ContentView.swift
//  LiveCameraSwiftUi
//  Created by Mac Mini on 27/01/2024.
//
import SwiftUI
struct ContentView: View {
    @StateObject private var model = FrameHandler()
    @State private var progressValue: Float = 0.5
    var body: some View {
        ZStack (alignment:.top){
            
            
            
            FrameView(image: model.frame)
            
            
            
            overlayView()
            VStack {
                Spacer() // Pushes everything to the bottom
                VStack(alignment: .leading, spacing: 5) {
                    vitalSignView(name: "HR", icon: "heart.fill", value: "100 bpm", color: .red)
                    vitalSignView(name: "HRV", icon: "heart", value: "21 ms", color: .gray)
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
                        .foregroundColor(.black) // Change text color to blue

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
                .foregroundColor(.black).padding(.leading, 5)
 
            Image(systemName: icon)
                .foregroundColor(color) // Icon color remains as passed to the function
            Text(value)
                .foregroundColor(.black) // Set the font color to black for the value
        }
        .padding(EdgeInsets(top: 4, leading: 8, bottom: 4, trailing: 8)) // Reduced padding around HStack
    }
    
    
    
    @ViewBuilder
    private func overlayView() -> some View {
        GeometryReader { geometry in
            VStack {
                ZStack {
                    Path { path in
                        let width = geometry.size.width * 0.6
                        let height = geometry.size.height * 0.4
                        let originX = (geometry.size.width - width) / 2
                        // Adjust originY for responsiveness
                        let originY = geometry.size.height * 0.5 - height / 1.4
                        
                        path.addRect(CGRect(origin: .zero, size: geometry.size))
                        let ellipseRect = CGRect(x: originX, y: originY, width: width, height: height)
                        path.addEllipse(in: ellipseRect)
                    }
                    .fill(Color.white.opacity(1), style: FillStyle(eoFill: true))
                    
                    Path { path in
                        let width = geometry.size.width * 0.6
                        let height = geometry.size.height * 0.4
                        let originX = (geometry.size.width - width) / 2
                        let originY = geometry.size.height * 0.5 - height / 1.4
                        let ellipseRect = CGRect(x: originX, y: originY, width: width, height: height)
                        
                        path.addEllipse(in: ellipseRect)
                    }
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                    .foregroundColor(.black)
                    
                    //                    // Make CircularProgressBar responsive
                    //                    CircularProgressBar(progress: self.progressValue)
                    //                        .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                    //                        .position(x: geometry.size.width / 2, y: geometry.size.height * 0.5) // Centered vertically
                }
            }
        }
    }
    
    struct CircularProgressBar: View {
        var progress: Float // The current progress (0.0 to 1.0)
        var body: some View {
            ZStack {
                Circle() // Progress track
                    .stroke(lineWidth: 20)
                    .opacity(0.3)
                    .foregroundColor(Color.blue)
                
                Circle() // Progress indicator
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: 270)) // Start from the top
                    .animation(.linear, value: progress)
            }
        }
    }
}
