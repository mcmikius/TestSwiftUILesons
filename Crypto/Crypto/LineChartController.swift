//
//  LineChartController.swift
//  Crypto
//
//  Created by Mykhailo Bondarenko on 01.11.2019.
//  Copyright © 2019 Mykhailo Bondarenko. All rights reserved.
//

import SwiftUI
import UIKit


struct LineChartController: UIViewRepresentable {

    let lineCoordinates: [CGFloat]
    let inline: Bool
    
    func updateUIView(_ uiView: LineChart, context: UIViewRepresentableContext<LineChartController>) {
        // ..
    }
    
    func makeUIView(context: Context) -> LineChart {
        
        let lineChart = LineChart()
        
        lineChart.addLine(lineCoordinates)
        
        
        if inline {
            lineChart.y.labels.visible = false
            lineChart.x.labels.values = ["Yesterday", "Today", "Tomorrow"]
        } else {
            
            lineChart.x.labels.values = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"]
        }
        
        return lineChart
    }
}

