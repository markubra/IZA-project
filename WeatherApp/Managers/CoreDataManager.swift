//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 25.05.2022.
//

import CoreData

class CoreDataManager: ObservableObject {
    let container: NSPersistentContainer
    @Published var savedEntites: [LocationEntity] = []
    
    init() {
        container = NSPersistentContainer(name: "LocationsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error Loading Data: \(error)")
            }
        }
        fetchLocations()
    }
    
    func fetchLocations() {
        let request = NSFetchRequest<LocationEntity>(entityName: "LocationEntity")
        
        do {
            savedEntites = try container.viewContext.fetch(request)
        } catch let error {
            print("Error Fetching Data: \(error)")
        }
    }
    
    func addLocation(text: String) {
        let newLocation = LocationEntity(context: container.viewContext)
        newLocation.name = text
        saveData()
    }
    
    func deleteLocation(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntites[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchLocations()
        } catch let error {
            print("Error Saving Data: \(error)")
        }
    }
}
