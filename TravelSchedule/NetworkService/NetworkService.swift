//
//  NetworkService.swift
//  TravelSchedule
//
//  Created by Алексей Моторин on 09.03.2024.
//

import OpenAPIRuntime
import OpenAPIURLSession

typealias TrainsBetweenStation = Components.Schemas.Trains_Between_Station
typealias TrainsByStation = Components.Schemas.Trains_By_Station
typealias ListOfRouteStations = Components.Schemas.List_Of_Route_Stations
typealias NearestStations = Components.Schemas.Stations
typealias Settlement = Components.Schemas.Settlement
typealias CarrierInformation = Components.Schemas.CarrierInformation
typealias AllAvailableStations = Components.Schemas.AllAvailableStations
typealias CopyrightYandex = Components.Schemas.CopyrightYandex

protocol NetworkServiceProtocol {
    func trainsScheduleBetweenStation(from: String, to: String) async throws -> TrainsBetweenStation
    func trainsScheduleByStation(station: String) async throws -> TrainsByStation
    func listOfRouteStations(uid: String) async throws -> ListOfRouteStations
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations
    func getNearestSettlement(lat: Double, lng: Double) async throws -> Settlement
    func getCarrierInformation(code: String) async throws -> CarrierInformation
    func getAllAvailableStations(format: Operations.getAllAvailableStations.Input.Query.formatPayload) async throws -> HTTPBody
    func getCopyright() async throws -> CopyrightYandex
}

final class NetworkService: NetworkServiceProtocol {

    private let client: Client
    private let apikey: String

    init(client: Client, apikey: String) {
        self.client = client
        self.apikey = apikey
    }

    func trainsScheduleBetweenStation(from: String, to: String) async throws -> TrainsBetweenStation {
        let response = try await client.trainsScheduleBetweenStation(query: .init(apikey: apikey, from: from, to: to))
        return try response.ok.body.json
    }
    
    func trainsScheduleByStation(station: String) async throws -> TrainsByStation {
        let response = try await client.trainsScheduleByStation(query: .init(apikey: apikey, station: station))
        return try response.ok.body.json
    }

    func listOfRouteStations(uid: String) async throws -> ListOfRouteStations {
        let response = try await client.listOfRouteStations(query: .init(apikey: apikey, uid: uid))
        return try response.ok.body.json
    }
    
    func getNearestStations(lat: Double, lng: Double, distance: Int) async throws -> NearestStations {
        let response = try await client.getNearestStations(query: .init(apikey: apikey, lat: lat, lng: lng, distance: distance))
        return try response.ok.body.json
    }
 
    func getNearestSettlement(lat: Double, lng: Double) async throws -> Settlement {
        let response = try await client.getNearestSettlement(query: .init(apikey: apikey, lat: lat, lng: lng))
        return try response.ok.body.json
    }
    
    func getCarrierInformation(code: String) async throws -> CarrierInformation {
        let response = try await client.getCarrierInformation(query: .init(apikey: apikey, code: code))
        return try response.ok.body.json
    }

    func getAllAvailableStations(format: Operations.getAllAvailableStations.Input.Query.formatPayload = .json) async throws -> HTTPBody {
        let response = try await client.getAllAvailableStations(query: .init(apikey: apikey, format: format))
        return try response.ok.body.html
    }
    
    func getCopyright() async throws -> CopyrightYandex {
        let response = try await client.getCopyright(query: .init(apikey: apikey))
        return try response.ok.body.json
    }
}
