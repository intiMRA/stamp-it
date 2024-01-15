//
//  Customer.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation

struct Customer: Identifiable {
    let id: String
    let name: String
    
    let subscribedStores: [Store]
    let cards: [StampCard]
}
