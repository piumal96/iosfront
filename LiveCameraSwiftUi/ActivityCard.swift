//
//  ActivityCard.swift
//  LiveCameraSwiftUi
//
//  Created by Mac Mini on 02/02/2024.
//

import SwiftUI

// Corrected the property names to follow Swift's naming conventions
struct Activity {
    let name: String
    let value: String
    let measurement: String
    let icon: String
}

struct ActivityCard: View {
    @State var activity: Activity
    
    var body: some View {
        ZStack {
            Color(uiColor: .systemGray6).cornerRadius(16)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        // Use corrected property names here
                        Text(activity.name).font(.system(size: 22))
                     //   Text(activity.value).font(.system(size: 22))
                    }
                    
                    Spacer()
                    Image(systemName: activity.icon).foregroundColor(.red)
                }
               
                
                // Dynamically display the value and measurement
                Text("\(activity.value) ")
                    .font(.system(size: 20)) +
                Text("\(activity.measurement)")
                    .font(.system(size: 12))

            }
            .padding()
        }
        
    }
}

// Corrected the preview provider syntax and used camelCase for property names
struct ActivityCard_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCard(activity: Activity(name: "Heart Rate", value: "120", measurement: "BPM", icon: "heart.fill"))
    }
}
