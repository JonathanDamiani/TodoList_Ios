//
//  HandleData.swift
//  Todo_Ios
//
//  Created by Jonathan Dean de Melo Damiani on 2020-10-18.
//  Copyright © 2020 deanvelopment. All rights reserved.
//

import Foundation

class HandleData
{
    static let docsUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
    
    static let dataFile = docsUrl.appendingPathComponent("alldata.plist")
    
    class func write ()
    {
        guard let items = AppData.items else { return }
        
        do
        {
            let archiver = try NSKeyedArchiver.archivedData(withRootObject: items, requiringSecureCoding: false)
            
            try archiver.write(to: dataFile)
        }
        catch
        {
            print (error)
        }
       
    }
    
    class func read()
    {
        let data = try? Data(contentsOf: dataFile)
        
        if data == nil
        {
            AppData.items = []
            return
        }
        
        do
        {
            if let readArr = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data!) as? Array<Item>
            {
                AppData.items = readArr
            }
        }
        catch
        {
            AppData.items = []
            print(error)
        }
    }
}
