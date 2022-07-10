//
//  FrameworkImageTitleView.swift
//  AppleFrameworksSwiftUI
//
//  Created by Oscar Cristaldo on 2022-07-09.
//

import SwiftUI

struct FrameworkImageTitleView: View {
    
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 70, height: 70)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
                .padding()
        }
        
    }
}

struct FrameworkImageTitleView_Previews: PreviewProvider {
    static var previews: some View {
        FrameworkImageTitleView(framework: MockData.sampleFramework)
    }
}
