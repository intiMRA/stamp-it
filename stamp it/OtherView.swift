//
//  OtherView.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import SwiftUI

class OtherViewModel: ObservableObject, Hashable {
    let id: String
    init(id: String) {
        self.id = id
    }
    
    static func == (lhs: OtherViewModel, rhs: OtherViewModel) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

struct OtherView: View {
    @StateObject var vm: OtherViewModel
    var body: some View {
        Text(vm.id)
    }
}
