//
//  ContentView.swift
//  WaterTracker
//
//  Created by Khawlah Khalid on 08/10/2023.
//

import SwiftUI
struct ContentView: View {
    let appTitle: String = "Water tracker 💦"
    @State var allowSharingAppleHealthData :Bool = false
    @State var noOfCubs: Int = 0
    @State var showWaterCupsView :Bool = false

var body: some View {
        NavigationStack{
            VStack(spacing: 24){
                Text(appTitle)
                    .bold()
                    .font(.title3)

                Toggle("Apple health", isOn: $allowSharingAppleHealthData)

                Stepper {
                    Text("Cups to drink per day \(noOfCubs)")
                } onIncrement: {
                    increment()
                } onDecrement: {
                    decrement()
                }

                Button {
                    showWaterCupsView.toggle()
                } label: {
                    Text("Continue")

                }
            }
            .navigationTitle("Water Tracker")
        }
        .padding()
        .fullScreenCover(isPresented: $showWaterCupsView) {
            WaterCupsView(noOfCups: noOfCubs, showWaterCupsView: $showWaterCupsView)
        }
    }
    
    func increment(){
        noOfCubs += 1
    }
    
    func decrement(){
        noOfCubs -= 1
    }
    
}



#Preview {
    ContentView()
}
