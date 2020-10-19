//
//  Item.swift
//  Todo_Ios
//
//  Created by Jonathan Dean de Melo Damiani on 2020-09-18.
//  Copyright © 2020 deanvelopment. All rights reserved.
//

import Foundation

class Item: NSObject, NSCoding
{
    var name: String!
    var done: Bool!
    
    override init()
    {

    }
    
    init(name: String, done: Bool)
    {
        self.name = name
        self.done = done
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(self.name, forKey: "name")
        coder.encode(self.done.string, forKey: "done")
    }
    
    required convenience init?(coder: NSCoder)
    {
        let name = coder.decodeObject(forKey: "name") as! String
        let done = coder.decodeObject(forKey: "done") as! String
        
        self.init (name: name, done: done.bool )
    }
}
