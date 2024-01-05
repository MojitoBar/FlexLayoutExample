//
//  ViewModel.swift
//  FlexLayoutExample
//
//  Created by 주동석 on 1/4/24.
//

import Foundation

final class ViewModel {
    @Published var count: Int = 0
    
    func addCount(value: Int) {
        count += value
    }
}
