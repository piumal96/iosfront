//
//  HomeView.swift
//  LiveCameraSwiftUi
//
//  Created by Mac Mini on 02/02/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack (alignment:.leading){ // Corrected the typo here from Vstack to VStack
            
            VStack(alignment:.leading){
                Text("Home Screen") // Title at the top
                                  .font(.title)
                                  .padding([.leading, .trailing, .top]) // Apply padding except bottom to bring the texts closer
                              
                              Text("Welcome Kumara")
                                  .font(.title3)
                                  .padding([.leading, .trailing, .bottom]).opacity(0.5)
            }
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 10), count: 1)) {
                // Assuming ActivityCard is a valid View component
                // RMSSD Card
                          ActivityCard(activity: Activity(name: "HR", value: "25", measurement: "ms", icon: "waveform.path.ecg"))
                          // SBP Card
                          ActivityCard(activity: Activity(name: "SBP", value: "120", measurement: "mmHg", icon: "heart.fill"))
                          // RR Card
                          ActivityCard(activity: Activity(name: "RR", value: "16", measurement: "breaths/min", icon: "wind"))
                          // SPO2 Card
                          ActivityCard(activity: Activity(name: "SPO2", value: "98%", measurement: "Saturation", icon: "lungs.fill"))
                          // DBP Card
                          ActivityCard(activity: Activity(name: "DBP", value: "80", measurement: "mmHg", icon: "heart.fill"))
            }.padding()
        }       .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            
    }
}

#Preview {
    HomeView()
}
