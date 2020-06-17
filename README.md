# Realm Master

## Introduction:

This project is created to understand the working of Realm Master and also to have a ready made component for integration in the projects. 

If you want to implement it straight away, you can make copy the handler in the project and jump to the Usage part.

---------------------------------------------------------------------------------------------------

## Installation:

Include below pod in your podfile for Integration and install using pod install

```
pod 'RealmSwift'
```


----------------------------------------------------------------------------------------------------

## Configuration:

There is no specific configuration needed for this implementation.

----------------------------------------------------------------------------------------------------

## Coding Part - Handler:

Sample Class is given in the handler to show the demo. There are four important section of this handler. (i) Read (ii) Write (iii) Update (iv) Delete

### Read

```
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
```

### Write

```
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
```


### Update

```
     static func updateForceFully<T:Object>(realmClass:T.Type,parameterName:String,parameterValue:String,newObject:T) {
         deleteObjectbyParameter(realmClass: realmClass, parameterName: parameterName, parameterValue: parameterValue)
         writeData(data: newObject)
     }
```

### Delete

```
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
```

----------------------------------------------------------------------------------------------------

## Helper Part

### No helper needed

----------------------------------------------------------------------------------------------------

## Usage Part

### Refer the View controller for implementation of handler

----------------------------------------------------------------------------------------------------

## Template Part

### Go to ~/Library/Developer/Xcode/Templates and create your own template for Realm handler and add it just like any other file

## Snippets Part

### Go to ~/Library/Developer/Xcode/UserData/CodeSnippets/ in Finder and paste the Code snippets 

read_data - for reading data from realm
read_list - for reading list of data from realm
write_data - for write data in realm
write_list - for write list of data in realm

update_force - to update data forcefully
delete_object - to delete a specific object
delete_parameter - to delete the specific object based on the condition


### Check out my Post about  : [Realm Master](https://vijaysn.com/2020/04/23/ios-av-player/)
