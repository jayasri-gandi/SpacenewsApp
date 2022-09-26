//
//  NewsArticle.swift
//  SpaceNewsFlightApp
//
//  Created by Jayasri  on 22/09/22.
//

import SwiftUI
import CachedAsyncImage
import Foundation
import GoogleSignIn
import UIKit
import GoogleSignInSwift

struct NewsArticle: View {
    let imageurl: String
    let sisteName: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .center) {
                CachedAsyncImage(url: URL(string: imageurl),transaction: Transaction(animation: .easeInOut)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .frame(width:150,height: 120)
                    } else {
                        ProgressView()
                            .frame(width:150,height: 120)
                    }
                }
            }
            Text(sisteName).foregroundColor(.black)
                 .italic()
                 .padding(.leading, 10)
        }
        .overlay(RoundedRectangle(cornerRadius: 0)
            .stroke(Color.gray, lineWidth: 1))
    }
}

struct NewsArticle_Previews: PreviewProvider {
    static var previews: some View {
        NewsArticle( imageurl: "", sisteName: "jayasri news app")
    }
}
//title: "News App", imageurl: "",

