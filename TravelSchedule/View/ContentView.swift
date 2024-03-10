//
//  ContentView.swift
//  TravelSchedule
//
//  Created by Алексей Моторин on 04.03.2024.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var contentViewModel = ContentViewModel()

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
//            await contentViewModel.getCarrierInformation()
//            await contentViewModel.getCopyright()
//            await contentViewModel.getNearestStations()
//            await contentViewModel.trainsScheduleBetweenStation()
//            await contentViewModel.getNearestSettlement()
//            await contentViewModel.listOfRouteStations()
//            await contentViewModel.trainsScheduleByStation()
//            await contentViewModel.getAllAvailableStations()

        }
    }
}

#Preview {
    ContentView()
}
