//
//  DatabaseService.swift
//  RelaxApp
//
//  Created by Александр Меренков on 19.12.2022.
//

import CoreData
import UIKit

class DatabaseService {
    static let shared = DatabaseService()
    
//    MARK: - Properties
    private let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
//    MARK: - Lifecycle
    
    func isEmpty() -> Bool {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCredentials")
        do {
            let result = try context.fetch(fetchRequest)
            if result.isEmpty {
                return true
            }
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return false
    }
    
    func saveInformation(user: Credentials, asteroid: Asteroid) {
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "UserCredentials", in: context) else { return }
        
        let newRecord = NSManagedObject(entity: entity, insertInto: context)
        newRecord.setValue(user.nickname, forKey: "nickname")
        newRecord.setValue(user.describe, forKey: "describe")
        
        do {
            try context.save()
            saveAsteroid(asteroid: asteroid, predicate: user.nickname)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    private func saveAsteroid(asteroid: Asteroid, predicate: String) {
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "AsteroidData", in: context) else { return }
        
        let newRecord = NSManagedObject(entity: entity, insertInto: context)
        newRecord.setValue(asteroid.id, forKey: "id")
        newRecord.setValue(asteroid.name, forKey: "name")
        newRecord.setValue(asteroid.speed, forKey: "speed")
        newRecord.setValue(asteroid.distance, forKey: "distance")
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCredentials")
        fetchRequest.predicate = NSPredicate(format: "nickname == %@", predicate)
        
        do {
            let result = try context.fetch(fetchRequest)
            guard let user = result.first as? NSManagedObject else { return }
            newRecord.setValue(user, forKey: "visitor")
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
