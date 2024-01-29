//
//  FrameView.swift
//  LiveCameraSwiftUi
//
//  Created by Mac Mini on 27/01/2024.
//

import SwiftUI

struct FrameView: View {
    var image:CGImage?
    private let lable=Text("frame")
    var body: some View {
        if let image = image{
            Image(image,scale: 1.0,orientation: .up,label: lable)
        }else{
            Color.black
        }
    }
}

#Preview {
    FrameView()
}
