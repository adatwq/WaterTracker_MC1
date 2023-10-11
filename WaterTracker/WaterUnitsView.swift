//
//  WaterUnitsView.swift
//  WaterTracker
//
//  Created by Khawlah Khalid on 10/10/2023.
//

import SwiftUI

struct WaterCupsView: View {
    let noOfCups: Int
    @Binding var showWaterCupsView :Bool
    @State var selectedCups: [Int] = []
    var body: some View {
        VStack{
            HStack{
                Button {
                    showWaterCupsView.toggle()
                } label: {
                    Image(systemName: "x.circle.fill")
                        .font(.title)
                        .foregroundColor(.blue)
                        .padding()
                }
                Spacer()

            }
            Spacer()
            HStack{
                ForEach(0..<noOfCups,id: \.self) { i in
                    Image(systemName: selectedCups.contains(i) ? "drop.fill" : "drop")
                            .font(.title)
                            .foregroundColor(.blue)
                            .onTapGesture {
                                if selectedCups.contains(i){
                                    selectedCups.removeAll {$0 == i}
                                }
                                else{
                                    selectedCups.append(i)
                                }
                               
                            }

                }
            }
            Spacer()
        }

    }
}
#Preview {
    WaterCupsView(noOfCups: 9, showWaterCupsView: .constant(true))
}
