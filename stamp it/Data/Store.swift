//
//  Store.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation

protocol StoreProtocol {
    
}

actor Store: StoreProtocol {
    static private(set) var store: Store = Store()
}
