//
//  Store.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation

protocol StoreProtocol: ObservableObject, Actor {
    static var shared: any StoreProtocol { get set }
    func updateCustomer(_ newCustomer: Customer)
    
    func updateShops(_ shops: [Shop])
    
    func updateCards(_ cards: [StampCard])
    
    func updateShop(_ shop: Shop)
    
    func updateCard(_ card: StampCard)
}

actor Store: StoreProtocol {
    static var shared: any StoreProtocol = Store()
    @Published var customer: Customer = .init()
    @Published var shops: [Shop] = []
    @Published var stampCards: [StampCard] = []
    
    func updateCustomer(_ newCustomer: Customer) {
        self.customer = newCustomer
    }
    
    func updateShops(_ shops: [Shop]) {
        self.shops = shops
    }
    
    func updateCards(_ cards: [StampCard]) {
        self.stampCards = cards
    }
    
    func updateShop(_ shop: Shop) {

    }
    
    func updateCard(_ card: StampCard) {
        
    }
}
