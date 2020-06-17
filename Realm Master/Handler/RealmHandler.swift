//
//  RealmHandler.swift
//
//  Created by Vijay

//  Copyright © 2020. All rights reserved.
//

import UIKit
import Realm
import RealmSwift

//Prerequisite - include pod 'RealmSwift' and install the pod


//MARK: - Handler - CRUD
class DatabaseHandler {
    
    static func getDatabaseFilePath() -> String {
        return Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "Not Available"
    }
    
    static func readFirstData<T:Object>(realmClass:T.Type) -> T? {
         
        let realm = try! Realm()
        let realmData = realm.objects(realmClass)
        if realmData.count > 0 {
            if let firstData = realmData.first {
                return firstData
            }
        }
        return nil
        
    }
    static func readListofData<T:Object>(realmClass:T.Type) -> [T] {
         
        let realm = try! Realm()
        var listOfData:[T] = []
        let realmData = realm.objects(realmClass)
        if realmData.count > 0 {
            for data in realmData {
                listOfData.append(data)
            }
        }
        return listOfData
        
    }
    
    static func writeData<T:Object>(data:T) {
         
        let realm = try! Realm()
        do {
            try realm.write {
                realm.add(data)
            }
        } catch let error {
            #if DEBUG
            print(error)
            #endif
        }
        
    }
    static func writeListData<T:Object>(list:[T]) {
         
        let realm = try! Realm()
        do {
            try realm.write {
                for data in list {
                    realm.add(data)
                }
            }
        } catch let error {
            #if DEBUG
            print(error)
            #endif
        }
        
    }
    
    static func updateForceFully<T:Object>(realmClass:T.Type,parameterName:String,parameterValue:String,newObject:T) {
        deleteObjectbyParameter(realmClass: realmClass, parameterName: parameterName, parameterValue: parameterValue)
        writeData(data: newObject)
    }
    
    static func deleteSpecificObject<T:Object>(realmClass: T.Type) {
        
        let realm = try! Realm()
        let realmData = realm.objects(realmClass)
        
        do {
            try realm.write {
                realm.delete(realmData)
            }
        } catch let error {
            #if DEBUG
            print(error)
            #endif
        }
        
    }
    static func deleteObjectbyParameter<T:Object>(realmClass: T.Type,parameterName: String,parameterValue: String) {
        
        let realm = try! Realm()
        let realmData = realm.objects(realmClass).filter("\(parameterName) = '\(parameterValue)'")
        do {
            try realm.write {
                realm.delete(realmData)
            }
        } catch let error {
            #if DEBUG
            print(error)
            #endif
        }
        
    }
    static func deleteAllDatafromRealm() {
        
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
    }
    
}


//MARK: - Sample Class
class BasicProfile: Object {
    
    @objc dynamic var userID : String = ""
    @objc dynamic var userName : String = ""
    @objc dynamic var email : String = ""
    @objc dynamic var basicProfileDone : Bool = false
    @objc dynamic var otpVerified : Bool = false
    
    
    init(userID:String,userName:String,email:String,basicProfileDone:Bool,otpVerified:Bool) {
        self.userID = userID
        self.userName = userName
        self.email = email
        self.basicProfileDone = basicProfileDone
        self.otpVerified = otpVerified
    }
    
    required init() {
        //
    }
    
}
