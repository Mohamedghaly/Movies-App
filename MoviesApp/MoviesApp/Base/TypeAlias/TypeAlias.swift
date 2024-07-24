//
//  TypeAlias.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import Foundation
import UIKit

public typealias MessageState = (isSuccessState: Bool, message: String)

// MARK: - Collection Delegate
typealias CollectionViewDelegate = UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

// MARK: - TableView Delegate
typealias TableViewDelegate = UITableViewDataSource & UITableViewDelegate
