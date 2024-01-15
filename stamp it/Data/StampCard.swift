//
//  StampCard.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation

struct StampCard: Identifiable {
    let id: String
    let template: StampCardTemplate
    
    struct Row {
        let cols: [Column]
        
        struct Column {
            let isRewardSlot: Bool
            let isStamped: Bool
        }
    }
}

struct StampCardTemplate {
    let numberOfRows: Int
    let numberOfCols: Int
}
