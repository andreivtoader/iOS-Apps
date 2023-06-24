//
//  BikeManager.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

class BikeManager: ObservableObject {
    @Published var settings = Settings(unit: .km, serviceReminder: "100", serviceReminderOn: true, defaultBikeName: "")
    
    @Published var allRides = [Ride]()
    @Published var allBikes = [Bike]()
    
    @Published var formValidator = FormValidator()
    
    @Published var notificationHandler = NotificationHandler()
}

// MARK: - BikeManager bikes methods
extension BikeManager {
    
    func add(bike: Bike) {
        self.allBikes.append(bike)
        updateDefaultBikeName(bike: bike)
    }
    
    func add(ride: Ride, to bike: Bike) {
        if var bike = allBikes.filter({$0 == bike}).first {
            bike.rides.append(ride)
        }
    }
    
    func update(bike: Bike, withValues updatedBike: Bike) {
        //also update the rides
        allRides.indices.filter {allRides[$0].bike == bike}.forEach{allRides[$0].bike = updatedBike}
        
        allBikes.removeAll {$0 == bike}
        self.allBikes.append(updatedBike)
            
        updateDefaultBikeName(bike: updatedBike)
    }
    
    func delete(bike: Bike) {
        allBikes.removeAll{$0 == bike}
        allRides.removeAll{$0.bike == bike}
        
        removeDefaultBikeName(bikeName: bike.name)
    }
    
    func getAllRides(for bike: Bike) -> [Ride] {
        return allRides.filter {$0.bike == bike}
    }
    
    func getDistancePercentage(for bike: Bike) -> CGFloat {
        let rides = allRides.filter { $0.bike == bike }
        let distance = rides.map { Double($0.distance) ?? 0.0 }.reduce(0, +)
        let percentage = (distance * 100.0) / (Double(bike.serviceDue) ?? 1.0)
        
        return percentage
    }
    
    func getDistanceRidden(for bike: Bike) -> Int {
        return allRides
            .filter{$0.bike == bike}
                    .map{Int($0.distance) ?? 0}
                    .reduce(0, +)
    }
    
    func checkServiceNotifications() {
        guard settings.serviceReminderOn else { return }
        
        for bike in allBikes {
            let distanceToService = distanceToService(for: bike)
            let isDue = distanceToService < (Int(settings.serviceReminder) ?? 0)
            
            if isDue {
                notificationHandler.notification.isActive.toggle()
                notificationHandler.notification.bikeName = bike.name
                notificationHandler.notification.unit = settings.unit.description
                notificationHandler.notification.distance = String(distanceToService)

                notificationHandler.sendNotification(title: bike.name, body: "Service in \(notificationHandler.notification.distance)\(settings.unit.description)")
            }
        }
    }
    
    private func distanceToService(for bike: Bike) -> Int {
        let currentDistanceRidden = getDistanceRidden(for: bike)
        let serviceIn = Int(bike.serviceDue) ?? 0
        
        return serviceIn - currentDistanceRidden
    }
}

// MARK: - BikeManager rides methods
extension BikeManager {
    
    func update(ride: Ride, withValues updatedRide: Ride) {
        allRides.removeAll {$0 == ride}
        self.allRides.append(updatedRide)
    }
    
    func delete(ride: Ride) {
        allRides.removeAll{$0 == ride}
    }
    
    func getTotalRides(for bike: Bike) -> Int {
        return allRides.filter {$0.bike == bike}.count
    }
    
    func getTotalDistanceRidden() -> Int {
        return allRides.map{Int($0.distance) ?? 0}.reduce(0, +)
    }
    
    func getTotalNumberOfDistance(for bikeType: BikeType) -> Int {
        return allRides
                    .filter{$0.bike.type == bikeType}
                    .map{Int($0.distance) ?? 0}
                    .reduce(0, +)
    }

}

// MARK: - BikeManager settings methods
extension BikeManager {
    
    func updateDefaultBikeName(bike: Bike) {
        // update default settings bike name if that's the case
        if bike.isDefault {
            settings.defaultBikeName = bike.name
        }
    }
    
    func removeDefaultBikeName(bikeName: String) {
        if settings.defaultBikeName == bikeName {
            settings.defaultBikeName = ""
        }
    }
    
}
