//
//  ChartView.swift
//  Coins
//
//  Created by Bekbol Bolatov on 09.01.2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    let viewModel: CoinDetailsViewModel
    var body: some View {
        Chart {
            ForEach(viewModel.chartDataArray) { item in
                LineMark(
                    x: .value("Date", item.date),
                    y: .value("Value", item.value)
                )
                .interpolationMethod(.cardinal)
            }
        }
        .chartXScale(domain: ClosedRange(uncheckedBounds: (
            viewModel.startDate,
            viewModel.endDate
        )))
        .chartXAxis {
            AxisMarks(position: .bottom, values: viewModel.xAxisValues)
        }
        .chartYScale(domain: ClosedRange(uncheckedBounds:(
            viewModel.minPrice,
            viewModel.maxPrice
        )))
        .chartYAxis {
            AxisMarks(position: .leading, values: viewModel.yAxisValues)
        }
    }
}

//#Preview {
//    ChartView()
//}
