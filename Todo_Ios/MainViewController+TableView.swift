//
//  MainViewController+TableView.swift
//  Todo_Ios
//
//  Created by Jonathan Dean de Melo Damiani on 2020-09-20.
//  Copyright © 2020 deanvelopment. All rights reserved.
//

import UIKit

extension MainViewController
{
    
    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.black
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if section == 0
        {
            return "Items To Do"
        }
        else
        {
            return "Done Items"
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    // Delete
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle != .delete
        {
            return
        }
        
        var item = Item()
        if indexPath.section == 0
        {
            item = activeItems[indexPath.row]
            activeItems.remove(at: indexPath.row)
            
        }
        else
        {
            item = doneItems[indexPath.row]
            doneItems.remove(at: indexPath.row)
        }
        
        for i in 0..<AppData.items.count
        {
            let itemInAppData = AppData.items[i]
            
            if (itemInAppData.description == item.description)
            {
                AppData.items[i] = item
                break
            }
        }
        
        tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.right)
    }
    
    // Toggle item done
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        var item = Item()
        
        if indexPath.section == 0
        {
            item = activeItems[indexPath.row]
            item.done = true
            activeItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.left)
            
            doneItems.append(item)
            let newIndexPath = IndexPath(row: doneItems.count - 1, section: 1)
            tableView.insertRows(at: [newIndexPath], with: UITableView.RowAnimation.right)
        }
        else
        {
            item = doneItems[indexPath.row]
            item.done = false
            doneItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.right)
            
            activeItems.append(item)
            let newIndexPath = IndexPath(row: activeItems.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: UITableView.RowAnimation.left)
        }
        
        for i in 0..<AppData.items.count
        {
            let itemInAppData = AppData.items[i]
            
            if (itemInAppData.description == item.description)
            {
                AppData.items[i] = item
            }
        }
    }
    
    // Number of items per section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0
        {
            return activeItems.count
        }
        else
        {
            return doneItems.count
        }
    }
    
    // Loading table view with data
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCellId", for: indexPath)
        
        var thisItem = Item()
        
        if indexPath.section == 0
        {
            thisItem = activeItems[indexPath.row]
        }
        else
        {
            thisItem = doneItems[indexPath.row]
        }
        
        let attrString = NSMutableAttributedString(string: thisItem.description)
        
        if thisItem.done
        {
            attrString.addAttribute(.strikethroughStyle, value:2.0, range: NSMakeRange(0, attrString.length))
            cell.backgroundColor = .darkGray
            cell.accessoryType = .checkmark
            cell.textLabel?.textColor = .lightGray
        }
        else
        {
            attrString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attrString.length))
            cell.backgroundColor = .lightGray
            cell.accessoryType = .none
            cell.textLabel?.textColor = .black
        }
        
        cell.textLabel?.attributedText = attrString
        
        return cell
    }
}
