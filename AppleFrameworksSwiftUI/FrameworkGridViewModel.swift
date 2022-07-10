//
//  FrameworkGridViewModel.swift
//  AppleFrameworksSwiftUI
//
//  Created by Oscar Cristaldo on 2022-07-08.
//

import SwiftUI

final class FrameworkGridViewModel: ObservableObject {
    
    var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    
    @Published var isShowingDetailView = false
    
}
