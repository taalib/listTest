//
//  List.swift
//  ListsTest
//
//  Created by Minhas, Taalib (ELS-LON) on 21/09/2017.
//  Copyright © 2017 Taalib Minhas. All rights reserved.
//

import UIKit
import os.log


class List: NSObject, NSCoding {
    
    //MARK: Properties
    var toDo: String
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("toDo")
    
    //MARK: Types
    struct PropertyKey {
        
        static let toDo = "toDo"
        
    }

    //MARK: Initialization
    init?(toDo: String) {
        
        // The name must not be empty
        guard !toDo.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.toDo = toDo
        
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(toDo, forKey: PropertyKey.toDo)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let toDo = aDecoder.decodeObject(forKey: PropertyKey.toDo) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }

        // Must call designated initializer.
        self.init(toDo: toDo)
    }
}

