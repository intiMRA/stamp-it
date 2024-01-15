//
//  ScanningViewModelRepository.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import Foundation
protocol ScanningViewModelRepositoryProtocol {
    func scanned(code: String) async
}

class ScanningViewModelRepository: ScanningViewModelRepositoryProtocol {
    func scanned(code: String) async {
        
    }
}
