//
//  StampCard.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation

struct StampCard: Identifiable {
    var id: String = ""
    var template: StampCardTemplate = .init()
    
    struct Row {
        var cols: [Column] = []
        
        struct Column {
            var isRewardSlot: Bool = false
            var isStamped: Bool = false
        }
    }
}

struct StampCardTemplate {
    var numberOfRows: Int = 0
    var numberOfCols: Int = 0
}
