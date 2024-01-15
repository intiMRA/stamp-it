//
//  ScanningViewModel.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation
import Combine

enum ScanningViewModelState: String {
    case showStartState, scanning, showReward, blankScreen, showStampAnimation, showRewardAnimation
}
enum ScanningError: Error {
    case general
}

class ScanningViewModel: ObservableObject, Hashable {
    static func == (lhs: ScanningViewModel, rhs: ScanningViewModel) -> Bool {
        lhs.shouldScan == rhs.shouldScan
        && lhs.state == rhs.state
        && lhs.code == rhs.code
        && lhs.storeName == rhs.storeName
        && lhs.shouldShowAlert == rhs.shouldShowAlert
        && lhs.error == rhs.error
        && lhs.cancellable == rhs.cancellable
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(shouldScan)
        hasher.combine(state)
        hasher.combine(code)
        hasher.combine(storeName)
        hasher.combine(shouldShowAlert)
        hasher.combine(error)
        hasher.combine(cancellable)
    }
    
    static var invalidCharacters = CharacterSet(charactersIn: ".#$[]")
    var shouldScan: Bool = false
    @Published var state: ScanningViewModelState = .showStartState
    @Published var code: String = ""
    @Published var storeName = ""
    @Published var shouldShowAlert = false
    var error: ScanningError?
    private var cancellable = Set<AnyCancellable>()
    private let repository: ScanningViewModelRepositoryProtocol
    
    init(repository: ScanningViewModelRepositoryProtocol = ScanningViewModelRepository()) {
        self.repository = repository
        $code
            .dropFirst()
            .sink(receiveValue: { code in
                Task { @MainActor in
                    await self.addStamp(code: code)
                }
            })
            .store(in: &cancellable)
    }
    
    func startingState() {
        self.state = .showStartState
        shouldScan = false
    }
    
    func setCode(_ code: String) {
        self.code = code
        self.shouldScan = false
        self.state = .blankScreen
    }
    
    func addStamp(code: String) async {
        await repository.scanned(code: code)
    }
}
