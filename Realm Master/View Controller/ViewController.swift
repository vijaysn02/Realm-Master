//
//  ViewController.swift
//  API Master
//
//  Created by TPFLAP146 on 03/05/20.
//  Copyright © 2020 vijay. All rights reserved.
//

import UIKit

//MARK: - View Controller - Initialization
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(DatabaseHandler.getDatabaseFilePath())
        readListofData()
        
    }


}


//MARK: - Realm - Read
extension ViewController {
    
    func readFirstData() {
        guard let firstData = DatabaseHandler.readFirstData(realmClass: BasicProfile.self) else {
            print("No Data found")
            return
        }
        print(firstData.userName)
        print(firstData.basicProfileDone)
    }
    func readListofData() {
        let listofData = DatabaseHandler.readListofData(realmClass: BasicProfile.self)
        if listofData.count > 0 {
            print("\(listofData.count) Records Found")
        } else {
            print("Records Empty")
        }
    }
    
}

//MARK: - Realm - Write
extension ViewController {
    
    func writeData() {
        let profile = BasicProfile(userID: "7832", userName: "Vijay Kumar", email: "kumar@gmail.com", basicProfileDone: true, otpVerified: true)
        DatabaseHandler.writeData(data: profile)
    }
    
}


//MARK: - Realm - Delete
extension ViewController {
    
    func deleteAll() {
        DatabaseHandler.deleteAllDatafromRealm()
    }
    func deleteSpecificObject() {
        DatabaseHandler.deleteSpecificObject(realmClass: BasicProfile.self)
    }
    func deletebyParameter() {
        DatabaseHandler.deleteObjectbyParameter(realmClass: BasicProfile.self, parameterName: "userID", parameterValue: "7832")
    }
    
}
