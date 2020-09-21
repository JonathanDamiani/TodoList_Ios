//
//  MainViewController+SeparateItems.swift
//  Todo_Ios
//
//  Created by Jonathan Dean de Melo Damiani on 2020-09-20.
//  Copyright © 2020 deanvelopment. All rights reserved.
//

import Foundation

extension MainViewController
{
    func separateItems ()
    {
        for item in AppData.items
        {
            if item.done
            {
                doneItems.append(item)
            }
            else
            {
                activeItems.append(item)
            }
        }
    }

}
