//
//  ScanningView.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import SwiftUI
import DesignLibrary

struct ScanningView: View {
    @StateObject var viewModel = ScanningViewModel()
    
    var body: some View {
        ZStack {
            Color.background
            
            switch viewModel.state {
            case .showStartState:
                VStack {
                    Text("Please Tap To Scan")
                        .foregroundColor(Color.text)
                }
                .contentShape(Rectangle())
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .onTapGesture(count: 1, perform: {
                    viewModel.state = .scanning
                    viewModel.shouldScan = true
                    
                })
            case .scanning:
                QRCodeScanningViewSwiftUI(viewModel, shouldScan: viewModel.shouldScan)
            case .showReward:
                    VStack {
                        Text("Congrats \(viewModel.storeName)")
                            .foregroundColor(Color.text)
                    }
                    .contentShape(Rectangle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .onTapGesture(count: 1, perform: {
                        viewModel.state = .scanning
                        viewModel.shouldScan = true
                        
                    })
            case .blankScreen:
                EmptyView()
            case .showStampAnimation:
                LottieView(lottieFile: .stamp)
                    .squareFrame(size: 200)
            case .showRewardAnimation:
                LottieView(lottieFile: .reward)
                    .squareFrame(size: 200)
            }
            
        }
        .onAppear(perform: viewModel.startingState)
    }
}
