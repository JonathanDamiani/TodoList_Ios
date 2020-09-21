//
//  AppData.swift
//  Todo_Ios
//
//  Created by Jonathan Dean de Melo Damiani on 2020-09-18.
//  Copyright © 2020 deanvelopment. All rights reserved.
//

import Foundation

class AppData
{
    static var items: Array<Item>!
    
    class func initialize()
    {
        let item_1 = Item(description: "First Item", done: false)
        let item_2 = Item(description: "Second Item", done: true)
        
        items = [item_1, item_2]
    }
}
