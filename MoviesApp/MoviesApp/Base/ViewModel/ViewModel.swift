//
//  ViewModel.swift
//  iOSTask
//
//  Created by Mohamed Ghaly on 23/07/2024.
//

import Foundation
import Combine

open class BaseViewModel: NSObject {
    
    @Published open var isLoading: Bool?
    open var publisherIsLoading: Published<Bool?>.Publisher { $isLoading }
    open var cancelAbles: Set<AnyCancellable> = []
    
    open func showLoader() {
        isLoading = true
    }
}
