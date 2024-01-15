//
//  ContentView.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        List {
            Button("go to next") {
                router.navigate(to: .scanningView(.init()))
            }
        }
        .navigationDestination(for: Destination.self) { nextView in
            switch nextView {
            case .next(let vm):
                NextView(vm: vm)
                    .environmentObject(router)
            case .otherView(let vm):
                OtherView(vm: vm)
            case .scanningView(let vm):
                ScanningView(viewModel: vm)
            }
        }
    }
}
