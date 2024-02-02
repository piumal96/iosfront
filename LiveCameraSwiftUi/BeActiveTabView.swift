//
//  BeActiveTabView.swift
//  LiveCameraSwiftUi
//
//  Created by Mac Mini on 02/02/2024.
//

import SwiftUI

struct BeActiveTabView: View {
    @State private var selectedTab = "Home"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tag("Home")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
           
             ContentView()
                 .tag("Another")
                 .tabItem {
                     Label("Scan", systemImage: "face.smiling")
                 }
        }
    }
}

// Define a preview for your SwiftUI view
struct BeActiveTabView_Previews: PreviewProvider {
    static var previews: some View {
        BeActiveTabView()
    }
}
