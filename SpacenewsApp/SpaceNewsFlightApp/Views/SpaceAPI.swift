//
//  SpaceAPI.swift
//  SpaceNewsFlightApp
//
//  Created by Jayasri  on 22/09/22.
//

import SwiftUI
import Foundation
import GoogleSignIn
import UIKit
import GoogleSignInSwift

struct spaceAPI: View {
    @StateObject var data = SpaceAPI()
    @State var isLoading: Bool = false
    @State private var opac = 0.0
    var body: some View {
        NavigationStack {
            VStack {
                if isLoading {
                    ProgressView()
                } else {
                    newsView()
                        .opacity(opac)
                }
            }
            .environmentObject(data)
            .onAppear {
                data.getData()
                withAnimation(.easeIn(duration: 2)) {
                    opac = 1.0
                }
            }
        }
    }
}

struct spaceAPI_Previews: PreviewProvider {
    static var previews: some View {
        spaceAPI()
    }
}

