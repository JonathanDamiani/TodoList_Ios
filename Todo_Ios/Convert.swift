//
//  Convert.swift
//  Todo_Ios
//
//  Created by Jonathan Dean de Melo Damiani on 2020-10-18.
//  Copyright © 2020 deanvelopment. All rights reserved.
//

import Foundation

extension String
{
    var bool : Bool
    {
        switch self.lowercased() {
        case "true", "yes":
            return true
        default:
            return false
        }
    }
}

extension Bool
{
    var string: String
    {
        if self == true
        {
            return "true"
        }
        else
        {
            return "false"
        }
    }
}
