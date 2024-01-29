//
//  Customer.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation

struct Customer: Identifiable {
    var id: String = ""
    var name: String = ""
    
    var subscribedStores: [Store] = []
    var cards: [StampCard] = []
}
