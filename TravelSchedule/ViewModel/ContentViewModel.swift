//
//  ContentViewModel.swift
//  TravelSchedule
//
//  Created by Алексей Моторин on 09.03.2024.
//

import Foundation
import OpenAPIURLSession
import OpenAPIRuntime

final class ContentViewModel: ObservableObject {

    func getCarrierInformation() async {
        guard let service = getService() else { return }

        do {
            let result = try await service.getCarrierInformation(code: "63448")
            print(result)
        } catch let error {
            print(error.localizedDescription.description)
        }
    }

    func getCopyright() async {
        guard let service = getService() else { return }

        do {
            let result = try await service.getCopyright()
            print(result)
        } catch let error {
            print(error)
        }
    }

    func getNearestSettlement() async {

        guard let service = getService() else { return }

        do {
            let result = try await service.getNearestSettlement(lat: 55.678, lng: 37.2777)
            print(result)
        } catch let error {
            print(error)
        }
    }

    func getNearestStations() async {

        guard let service = getService() else { return }

        do {
            let result = try await service.getNearestStations(lat: 59.864177, lng: 30.319163, distance: 50)
            print(result)
        } catch let error {
            print(error)
        }
    }

    func listOfRouteStations() async {
        guard let service = getService() else { return }

        do {
            let result = try await service.listOfRouteStations(uid: "6075x7375_0_9881704_g24_4")
            print(result)
        } catch let error {
            print(error)
        }
    }

    func trainsScheduleBetweenStation() async {
        guard let service = getService() else { return }

        do {
            let result = try await service.trainsScheduleBetweenStation(from: "c146", to: "c213")
            print(result)
        } catch let error {
            print(error)
        }
    }

    func getAllAvailableStations() async {
        guard let service = getService() else { return }

        do {
            let body = try await service.getAllAvailableStations()
            let data = try await Data(collecting: body, upTo: 100 * 1024 * 1024)
            print("data", data)
            let allStations = try JSONDecoder().decode(AllAvailableStations.self, from: data)
            print(allStations)
        } catch let error {
            print(error)
        }
    }

    func trainsScheduleByStation() async {
        guard let service = getService() else { return }

        do {
            let result = try await service.trainsScheduleByStation(station: "s9600721")
            print(result)
        } catch let error {
            print(error)
        }
    }

    private func getService() -> NetworkService? {
        guard let serverURL = try? Servers.server1() else { return nil }

        let client = Client(
            serverURL: serverURL,
            transport: URLSessionTransport()
        )
        let service = NetworkService(
            client: client,
            apikey: "62243c42-f551-45c4-866f-8fd264132906"
        )
        return service
    }
}
