//
//  RealmManager.swift
//  Note Get MVP
//
//  Created by Muslim on 02.10.2020.
//  Copyright © 2020 emilimayilov. All rights reserved.
//

import UIKit
import RealmSwift


class RealmManager {
    
    private init() {}
    static let shared = RealmManager()
    
    var realm = try! Realm()
    
    
    func create<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object)
            }
        } catch {
           print("Create Error")
        }
    }
    
    
    func update<T: Object>(_ object: T, with dictionary: [String:Any?]) {
        do {
            try realm.write {
                for (key, value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
            print("Update Error")
        }
    }
    
    
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
            }
        } catch {
            print("Delete Error")
        }
        
    }
    
}
