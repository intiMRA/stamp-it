//
//  NextView.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import SwiftUI

class NextVM: ObservableObject, Hashable {
    static func == (lhs: NextVM, rhs: NextVM) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: String
    
    init(id: String) {
        self.id = id
    }
}

struct NextView: View {
    @StateObject var vm: NextVM
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            Text(vm.id)
            Button("other") {
                router.navigate(to: .otherView(.init(id: "others")))
            }
        }
    }
}
