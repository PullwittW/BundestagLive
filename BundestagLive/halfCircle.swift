//
//  halfCircle.swift
//  BundestagLive
//
//  Created by Wangu Pullwitt on 12.09.24.
//

import SwiftUI

struct halfCircle: View {
    
    let bigCircleRadius: CGFloat = 150  // Radius des großen Kreises
    let smallCircleRadius: CGFloat = 10 // Radius der kleinen Kreise
    
    var body: some View {
        ZStack {
            // Verschachtelte Schleife, um die kleinen Kreise im großen Kreis zu platzieren
            ForEach(0..<Int((2 * bigCircleRadius) / (2 * smallCircleRadius)), id: \.self) { i in
                ForEach(0..<Int((2 * bigCircleRadius) / (2 * smallCircleRadius)), id: \.self) { j in
                    let xOffset = CGFloat(i) * (2 * smallCircleRadius) - bigCircleRadius + smallCircleRadius
                    let yOffset = CGFloat(j) * (2 * smallCircleRadius) - bigCircleRadius + smallCircleRadius
                    if xOffset * xOffset + yOffset * yOffset <= bigCircleRadius * bigCircleRadius {
                        Circle()
                            .frame(width: 2 * smallCircleRadius, height: 2 * smallCircleRadius)
                            .offset(x: xOffset, y: yOffset)
                            .foregroundColor(.blue)
                    }
                }
            }
        }
        .frame(width: 2 * bigCircleRadius, height: 2 * bigCircleRadius)
        .background(Circle().stroke(Color.gray, lineWidth: 2))
    }
}

#Preview {
    halfCircle()
}
