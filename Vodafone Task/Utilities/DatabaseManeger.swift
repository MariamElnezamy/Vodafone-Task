//
//  DatabaseManeger.swift
//  Vodafone Task
//
//  Created by Admin on 22/09/2021.
//

import CoreData
import Foundation
import UIKit

struct DatabaseManager {
    static let shared = DatabaseManager()
    
    private var viewContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private init() {
    }
    
    // Store all items fetched from network
    func addAirlineListItems(_ items: [AirlineModel]) {
        // Clear all item before storing new
        deleteAllAirlineItems()
        
        let _:[AllAirlineLocalModel] = items.compactMap { (item) -> AllAirlineLocalModel in
            let airline = AllAirlineLocalModel(context: self.viewContext)
            airline.id = Int64(item.id ?? 0)
            airline.name = item.name
            airline.slogan = item.slogan
            airline.country = item.country
            airline.websiteLink = item.website
            airline.logo = item.logo
            return airline
        }
        saveContext()
    }
    
    // Fetch all stored items
    func fetchAllAirlineItems()->[AllAirlineLocalModel] {
        var result = [AllAirlineLocalModel]()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AllAirlineLocalModel")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \AllAirlineLocalModel.id, ascending: true)]
        do {
            if let all = try viewContext.fetch(request) as? [AllAirlineLocalModel] {
                result = all
            }
        } catch {
            
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }
    
    // Delete all stored items
    func deleteAllAirlineItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "AllAirlineLocalModel")
        do {
            if let all = try viewContext.fetch(request) as? [AllAirlineLocalModel] {
                for item in all {
                    viewContext.delete(item)
                }
            }
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        saveContext()
    }
    func getMapAirlineItem() -> [AirlineModel]{
        let localData = self.fetchAllAirlineItems()
        let items:[AirlineModel] = localData.compactMap { (airline) -> AirlineModel? in
            var item = AirlineModel()
            item.id = Int(airline.id)
            item.name = airline.name
            item.slogan = airline.slogan
            item.country = airline.country
            item.website = airline.websiteLink
            item.logo = airline.logo
            
            return item
        }
        return items
    }
    
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

