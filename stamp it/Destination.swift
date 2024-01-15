//
//  Destination.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation
import SwiftUI

enum Destination: Equatable, Hashable {
    case next(NextVM)
    case otherView(OtherViewModel)
    case scanningView(ScanningViewModel)
}

class Router: ObservableObject {
    @Published var stack = NavigationPath()
    
    func navigate(to destination: Destination) {
        stack.append(destination)
    }
    
    func pop() {
        stack.removeLast()
    }
}
