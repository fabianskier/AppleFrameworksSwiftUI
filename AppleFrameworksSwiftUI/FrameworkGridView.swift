//
//  FrameworkGridView.swift
//  AppleFrameworksSwiftUI
//
//  Created by Oscar Cristaldo on 2022-07-08.
//

import SwiftUI

struct FrameworkGridView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: viewModel.columns) {
                    ForEach(MockData.frameworks) { framework in
                        FrameworkImageTitleView(framework: framework)
                            .onTapGesture {
                                viewModel.selectedFramework = framework
                            }
                    }
                }
                .navigationTitle("🍎 Frameworks")
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    FrameworkDetailView(isShowingDetailView: $viewModel.isShowingDetailView, framework: viewModel.selectedFramework ?? MockData.sampleFramework)
                }
            }
        }
    }
}

// MARK: - FrameworkGridView_Previews
struct FrameworkGridView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkGridView()
            .preferredColorScheme(.dark)
    }
}
