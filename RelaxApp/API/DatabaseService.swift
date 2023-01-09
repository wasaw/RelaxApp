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
    
//    MARK: - Save
    
    func saveInformation(user: Credentials, asteroid: Asteroid) {
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "UserCredentials", in: context) else { return }
        
        let newRecord = NSManagedObject(entity: entity, insertInto: context)
        newRecord.setValue(user.nickname, forKey: "nickname")
        newRecord.setValue(user.describe, forKey: "describe")
        newRecord.setValue(user.start, forKey: "start")
        
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
    
    func saveCompleted(id: String, name: String, nickname: String) {
        let context = appDelegate.persistentContainer.viewContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Completed", in: context) else { return }
        
        let newRecord = NSManagedObject(entity: entity, insertInto: context)
        newRecord.setValue(name, forKey: "name")
        newRecord.setValue(nickname, forKey: "nickname")
        
        let fetchRequestAsteroid = NSFetchRequest<NSFetchRequestResult>(entityName: "AsteroidData")
        fetchRequestAsteroid.predicate = NSPredicate(format: "id == %@", id)
        
        let fetchRequestUser = NSFetchRequest<NSFetchRequestResult>(entityName: "UserCredentials")
        fetchRequestUser.predicate = NSPredicate(format: "nickname == %@", nickname)
        
        do {
            let resultAsteroid = try context.fetch(fetchRequestAsteroid)
            guard let asteroid = resultAsteroid.first as? NSManagedObject else { return }
            
            let resultUser = try context.fetch(fetchRequestUser)
            guard let user = resultUser.first as? NSManagedObject else { return }
            
            newRecord.setValue(asteroid, forKey: "asteroid")
            newRecord.setValue(user, forKey: "user")
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
//    MARK: - Load
    
    func loadNickname(completion: @escaping(Set<String>) -> Void) {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "UserCredentials")
        
        do {
            let result = try context.fetch(fetchRequest)
            var answer = Set<String>()
            for data in result {
                let nickname = data.value(forKey: "nickname") as? String ?? ""
                answer.insert(nickname)
            }
            completion(answer)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func loadInformation(completion: @escaping([Asteroid]?) -> Void)  {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "AsteroidData")
        
        do {
            let result = try context.fetch(fetchRequest)
            var asteroids: [Asteroid] = []
            for data in result {
                let id = data.value(forKey: "id") as? String ?? ""
                let name = data.value(forKey: "name") as? String ?? ""
                let distance = data.value(forKey: "distance") as? Double ?? 0
                let speed = data.value(forKey: "speed") as? String ?? ""
                guard let visitor = data.value(forKey: "visitor") as? NSManagedObject else { return }

                let nickname = visitor.value(forKey: "nickname") as? String ?? ""
                let describe = visitor.value(forKey: "describe") as? String ?? ""
                let start = visitor.value(forKey: "start") as? Double ?? 0
                let user = Credentials(nickname: nickname, describe: describe, start: start)
                let asteroid = Asteroid(id: id, name: name, isPotentiallyHazardous: false, speed: speed, distance: distance, user: user)
                asteroids.append(asteroid)
            }
            completion(asteroids)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        completion(nil)
    }
    
    func loadCompleted(completion: @escaping([Delivered]) -> Void) {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Completed")

        do {
            let result = try context.fetch(fetchRequest)
            var answer: [Delivered] = []
            for data in result {
                let name = data.value(forKey: "name") as? String ?? ""
                let nickname = data.value(forKey: "nickname") as? String ?? ""
                let item = Delivered(name: name, nickname: nickname)
                answer.append(item)
            }
            completion(answer)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
//    MARK: - Delete
    
    func delete(nickname: String) {
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Completed")
        fetchRequest.predicate = NSPredicate(format: "nickname == %@", nickname)
        
        do {
            let result = try context.fetch(fetchRequest)
            guard let item = result.first as? NSManagedObject else { return }
            context.delete(item)
            try context.save()
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
