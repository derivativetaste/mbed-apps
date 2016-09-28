//
//  Store.swift
//  L3I_Matthie_SQLite
//
//  Created by devbot on 9/28/16.
//  Copyright © 2016 devbot. All rights reserved.
//

import Foundation
import SQLite

class Store {
    var db : Connection?
    let item = Expression<String>("item")
    let price = Expression<Double>("price")
    let timestamp = Expression<Double>("timestamp")
    let type = Expression<String>("type")
    
    func getConnection(){
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        do{
            db = try Connection("\(path)/db.sqlite3")
        }catch{print("Connection Error")}
    }
    
    func makeTable(tableName: String){
        let newTable = Table("tableName")
        do{try db?.run(newTable.create { t in     // CREATE TABLE "users" (
            t.column(item, primaryKey: true)
            t.column(price, unique: true)
            t.column(type)
            t.column(timestamp)
        })}catch{print("shit failed yo")}
    }
    func insertRow(table: Table, itemString: String, priceVal: Double, typeString: String){
        do {
            let rowid = try db?.run(table.insert(item <- itemString, price <- priceVal)) //TODO: get insert time value and type
            print("inserted id: \(rowid)")
        }catch {print("insertion failed: \(error)")}
    }
    
    
    
    
}

