//
//  newsView.swift
//  SpaceNewsFlightApp
//
//  Created by Jayasri  on 22/09/22.
//

import SwiftUI
import Foundation
import GoogleSignIn
import UIKit
import GoogleSignInSwift

struct newsView: View {
    let colums: [GridItem] = [
        GridItem(.flexible(),spacing: nil,alignment: nil),
        GridItem(.flexible(),spacing: nil,alignment: nil)
    ]
    let columstwo : [GridItem] = [
        GridItem(.fixed(150),spacing: 50,alignment: .center),
        GridItem(.fixed(150),spacing: 50,alignment: .center)
    ]
    
    @EnvironmentObject var data : SpaceAPI
    @Environment(\.openURL) var openUrl
    
    var body: some View {
        NavigationView{
            ScrollView {
                HStack {
                        Button {
//                                GIDSignIn.sharedInstance.signOut()
                        } label: {
                            Image(systemName:"power")
                                .renderingMode(.template)
                                .font(.system(size: 50))
                                .foregroundColor(.black)
                                .frame(width: 35,height: 35)
                                .fontWeight(.bold)
                        }
                        .padding(.leading, 25)
                        Spacer()
                        Button {
                            data.getData()
                            print("Button pressed")
                        } label: {
                            Image(systemName:"arrow.clockwise")
                                .renderingMode(.template)
                                .font(.system(size: 50))
                                .foregroundColor(.black)
                                .frame(width: 35,height: 35)
                                .fontWeight(.bold)
                        }
                        .padding(.trailing, 25)
                    }
                .padding(15)
                Divider()
                    .frame(height: 0.9)
                    .overlay(.black)
                LazyVGrid(columns: colums, spacing: 0) {
                    Section(header: Text("Latest News")
                        .fontWeight(.bold)
                        .font(.largeTitle)
                        .padding(.trailing, 150)
                        .padding(20)) {
                        ForEach(data.news) { news in
                            NewsArticle( imageurl: news.imageUrl, sisteName: news.newsSite ).onTapGesture {
                                openUrl(URL(string: news.url)!)
                            }
                        }
                    }
                }
                }
            }
        }
    
    }

struct newsView_Previews: PreviewProvider {
    static var previews: some View {
        newsView()
            .environmentObject(SpaceAPI())
    }
}

