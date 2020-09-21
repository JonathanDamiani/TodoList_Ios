//
//  MainViewController+TextFieldDelegate.swift
//  Todo_Ios
//
//  Created by Jonathan Dean de Melo Damiani on 2020-09-20.
//  Copyright © 2020 deanvelopment. All rights reserved.
//

import UIKit

extension MainViewController: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.placeholder = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        // remove keyboard
        textField.resignFirstResponder()
        
        if let typedText = textField.text
        {
            if typedText == ""
            {
                textField.placeholder = "+ New Item"
                return true
            }
            
            textField.text = ""
            textField.placeholder = "+ New Item"
            
            for i in 0..<AppData.items.count
            {
                let item = AppData.items[i]
            
                if item.description.lowercased() == typedText.lowercased()
                {
                    AppData.items[i].done = false
                    self.tableView.reloadData()
                    return true
                }
            }
            
            let newItem = Item(description: typedText, done: false)
            
            AppData.items.append(newItem)
            activeItems.append(newItem)
            
            self.tableView.beginUpdates()
            
            let newIndexPath = IndexPath(row: activeItems.count - 1, section: 0)
            
            self.tableView.insertRows(at: [newIndexPath], with: UITableView.RowAnimation.fade)
            
            self.tableView.endUpdates()
            
            
            return true
        }
        else
        {
            return false
        }
    }
}
