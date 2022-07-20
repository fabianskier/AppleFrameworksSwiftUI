//
//  FrameworkDetailView.swift
//  AppleFrameworksSwiftUI
//
//  Created by Oscar Cristaldo on 2022-07-08.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @ObservedObject
    var viewModel: FrameworkDetailViewModel
    
    var body: some View {
        VStack {
            XDismissButton(isShowingDetailView: $viewModel.isShowingDetailView.wrappedValue)
            
            Spacer()
            
            FrameworkImageTitleView(framework: viewModel.framework)
            
            Text(viewModel.framework.description)
                .font(.body)
                .padding()
            
            Spacer()
            
            // Uncomment if you want to open Safari outside of your app
            //            Link(destination: URL(string: viewModel.framework.urlString) ?? URL(string: "www.apple.com")!) {
            //                AFButton(title: "Learn More")
            //            }
            
            Button {
                viewModel.isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .fullScreenCover(isPresented: $viewModel.isShowingSafariView, content: {
            SafariView(url: URL(string: viewModel.framework.urlString) ?? URL(string: "www.apple.com")!)
        })
        
    }
}

struct FrameworkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(viewModel: FrameworkDetailViewModel(framework: MockData.sampleFramework, isShowingDetailView: .constant(false)))
    }
}
