//
//  UITableView+ Ex.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 24/07/2024.
//

import UIKit

extension UITableView {
    
     func registerCellNib<Cell: UITableViewCell>(cellClass: Cell.Type, bundle: Bundle? = nil) {
        register(UINib(nibName: String(describing: Cell.self), bundle: bundle), forCellReuseIdentifier: String(describing: Cell.self))
    }

     func dequeue<Cell: UITableViewCell>() -> Cell {
        let identifier = String(describing: Cell.self)
        
        guard let cell = dequeueReusableCell(withIdentifier: identifier) as? Cell else {
            fatalError("Error in cell")
        }
        
        return cell
    }
}
