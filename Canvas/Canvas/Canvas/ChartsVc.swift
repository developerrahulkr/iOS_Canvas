//
//  ChartsVc.swift
//  Canvas
//
//  Created by urmila reddy on 06/10/20.
//  Copyright © 2020 urmila reddy. All rights reserved.
//

import UIKit
import Charts

class ChartsVc: UIViewController {
    
    
    @IBOutlet weak var barChartVieww: BarChartView!
    @IBOutlet weak var lineChartVieww: LineChartView!
    
    
    
let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let dataX = [1,2,3,4,5,6,7,8,9,10,11,12]
    let dataY = [0.78,1.88,1.889,3.99,4.55,3.45,0.12,1.67,1.689,3.123,4.123,3.577]
    
    
    let players2 = ["Ozil", "Ramsey", "Laca", "Auba", "Xhaka", "Torreira"]
  // let goals2 = [2, 8, 22, 64, 88, 92]
    
 //   let players2 = [0,1,1,3,4,3,0,1,1,3,4,3]
  //  let goals2 = [2, 8, 22, 64, 88, 92]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        customizeChart(dataPoints: months, valuesX: dataX.map{ Double($0) }, valuesY: dataY.map{ Double($0) })
     //   setChart()
        customizeChart2(dataPoints: months, valuesX: dataX.map{ Double($0) }, valuesY: dataY.map{ Double($0) })
    }
    
    func setChart()
       {
           let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
           
           let test = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
           
           var dataEntries: [BarChartDataEntry] = []
           
           for i in 0..<months.count
          {
               let dataEntry = BarChartDataEntry(x: Double(test[i]), y: Double(unitsSold[i]))
               
               dataEntries.append(dataEntry)
           }
           
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Visitor count")
           let chartData = BarChartData(dataSet: chartDataSet)
           
        
           barChartVieww.data = chartData
       barChartVieww.xAxis.axisMinimum = -0.5
        barChartVieww.xAxis.valueFormatter = IndexAxisValueFormatter(values:months)
        barChartVieww.xAxis.granularity = 1.0
         barChartVieww.xAxis.labelCount = 12
        
      //  barChartVieww.xAxis.setLabelCount(12, force: true)
       barChartVieww.xAxis.labelPosition = XAxis.LabelPosition.bottom

//barChartVieww.setExtraOffsets(left: 0, top: 0, right: 0, bottom: 0)
        
    //  barChartVieww.xAxis.avoidFirstLastClippingEnabled = true
        
      //  barChartVieww.data = chartData
     //   ChartIMG.data = chartData
       }
    
    
    func customizeChart(dataPoints: [String], valuesX: [Double], valuesY: [Double]) {
      // TO-DO: customize the chart here
        print(dataPoints.count)
        var dataEntries: [BarChartDataEntry] = []
        for i in 0..<dataPoints.count {
       //   let dataEntry = BarChartDataEntry(x: Double(valuesX[i]), y: Double(valuesY[i]))
            let dataEntry = BarChartDataEntry(x: Double(valuesX[i]), y: Double(valuesY[i]), data: dataPoints)
          dataEntries.append(dataEntry)
        }
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Bar Chart View")
       // chartDataSet.colors = [.orange, .orange, .orange, .orange, .orange, .orange]
        let chartData = BarChartData(dataSet: chartDataSet)
        barChartVieww.data = chartData
      
    //    barChartVieww.borderColor = .red
        
        
    /*    //Give the value of the months to the x axis
            barChartVieww.xAxis.valueFormatter = IndexAxisValueFormatter(values:dataPoints)
        barChartVieww.xAxis.granularity = 1.0

        //Position of the x axis, rotation of the labels on the x axis and show all the names of the months consecutively
            barChartVieww.xAxis.labelPosition = XAxis.LabelPosition.bottom
            barChartVieww.xAxis.labelRotationAngle = -60.0
        barChartVieww.xAxis.labelCount = 12
        barChartVieww.xAxis.setLabelCount(12, force: false)
           // barChartVieww.xAxis.setLabelCount(dataPoints.count, force: false)
     //   barChartVieww.backgroundColor = .red*/
        
        
      
    }
    
    func customizeChart2(dataPoints: [String], valuesX: [Double], valuesY: [Double]) {
        var chartdataEntries: [ChartDataEntry] = []
              for i in 0..<dataPoints.count {
               // let chartdataEntry = ChartDataEntry(x: values[i], y: Double(i))
                let chartdataEntry = ChartDataEntry(x: Double(valuesX[i]), y: Double(valuesY[i]), data: dataPoints)
                chartdataEntries.append(chartdataEntry)
              }
              let lineChartDataSet = LineChartDataSet(entries: chartdataEntries, label: "")
              let lineChartData = LineChartData(dataSet: lineChartDataSet)
              lineChartVieww.data = lineChartData
    }
   
}
