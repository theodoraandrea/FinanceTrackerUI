//
//  MoneyChart.swift
//  testui
//
//  Created by Theodora Andrea on 25/11/24.
//

import SwiftUI
import Charts

struct MoneyChart: View {
    
    let data = [("Red", 30), ("Blue", 40), ("Green", 20)]
    var body: some View {
        Chart {
            ForEach(data, id: \.0) { item in
                SectorMark(
                    angle: .value("Value", item.1),
                    innerRadius: .ratio(0.6),
                    angularInset: 2
                )
                .cornerRadius(5)
                .foregroundStyle(by: .value("Color", item.0))
                
            }
        }
        .scaledToFit()
        .chartLegend(alignment: .center, spacing: 16)
    }
}

#Preview {
    MoneyChart()
}
