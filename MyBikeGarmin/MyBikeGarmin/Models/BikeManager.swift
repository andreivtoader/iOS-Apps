//
//  BikeManager.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import Foundation

class BikeManager: ObservableObject {
    @Published var settings = Settings()
    
    @Published var allRides = [Ride]()
    @Published var allBikes = [Bike]()
    
    @Published var notificationHandler = NotificationHandler()
}

// MARK: - BikeManager bikes methods
extension BikeManager {
    
    func add(bike: Bike) {
        self.allBikes.append(bike)
        updateDefaultBikeName(bike: bike)
    }
    
    func add(ride: Ride, to bikeName: String) {
        if var bike = allBikes.filter({$0.name == bikeName}).first {
            bike.rides.append(ride)
        }
    }
    
    func update(bikeName: String, withValues updatedBike: Bike) {
        allBikes.removeAll {$0.name == bikeName}
        self.allBikes.append(updatedBike)
            
        updateDefaultBikeName(bike: updatedBike)
    }
    
    func delete(bike: Bike) {
        allBikes.removeAll{$0.name == bike.name}
    }
    
    func getAllRides(for bike: Bike) -> [Ride] {
        return allRides.filter {$0.bike.name == bike.name}
    }
    
    func getDistancePercentage(for bike: Bike) -> CGFloat {
        let rides = allRides.filter { $0.bike.name == bike.name }
        let distance = rides.map { Double($0.distance) ?? 0.0 }.reduce(0, +)
        let percentage = (distance * 100.0) / (Double(bike.serviceDue) ?? 1.0)
        
        return percentage
    }
    
    func getDistanceRidden(for bike: Bike) -> Int {
        return allRides
            .filter{$0.bike.name == bike.name}
                    .map{Int($0.distance) ?? 0}
                    .reduce(0, +)
    }
    
    func checkServiceNotifications() {
        guard settings.serviceReminderOn else { return }
        
        for bike in allBikes {
            let isDue = checkServiceDue(for: bike)
            if isDue {
                notificationHandler.notification.isActive.toggle()
                notificationHandler.notification.bikeName = bike.name
                notificationHandler.notification.unit = settings.unit.description
                notificationHandler.notification.distance = settings.serviceReminder
                
                notificationHandler.sendNotification(title: bike.name, body: "Service in \(settings.serviceReminder)\(settings.unit.description)")
            }
        }
    }
    
    private func checkServiceDue(for bike: Bike) -> Bool {
        let currentDistanceRidden = getDistanceRidden(for: bike)
        let serviceReminder = Int(settings.serviceReminder) ?? 0
        let serviceIn = Int(bike.serviceDue) ?? 0
        
        return (serviceIn - currentDistanceRidden) < serviceReminder
    }
}

// MARK: - BikeManager rides methods
extension BikeManager {
    
    func update(rideName: String, withValues updatedRide: Ride) {
        allRides.removeAll {$0.title == rideName}
        self.allRides.append(updatedRide)
    }
    
    func delete(ride: Ride) {
        allRides.removeAll{$0.title == ride.title}
    }
    
    func getTotalRides(for bike: Bike) -> Int {
        return allRides.filter {$0.bike.name == bike.name}.count
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
    
}
