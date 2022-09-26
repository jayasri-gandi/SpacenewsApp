//
//  Login.swift
//  SpaceNewsFlightApp
//
//  Created by Jayasri  on 22/09/22.
//

import SwiftUI
import Foundation
import GoogleSignIn
import UIKit
import GoogleSignInSwift

var lightGreyColour = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)
let StoredUserName = "jayassree"
let password = "123456789"

struct loginScreen: View {
    @State var isGoogle: Bool = false
    @State var userName: String = ""
    @State var passWord: String = ""
    @State var authenticationDidFail: Bool=false
    @State var authenticationDidSucced: Bool=false
    var body: some View {
        NavigationView{
            ZStack {
                Color.black
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    HelloText()
                    userNameTextField(userName: $userName)
                    passwordSecureFeild(password: $passWord)
                    if authenticationDidFail {
                        Text("Information not correct, try again.").offset(y:-10)
                        foregroundColor(.red)
                    }
                    Button(action:
                            {print("Button tapped")}) {
                        loginButtonContent()
                    }
                    VStack {
                        Button(action:
                                {
                            googleSignInfo()
                        }
                               
                        ){
                            googleBtn(isGoogle: true)
                        }
                    }
                }
                .padding()
                if authenticationDidSucced {
                    Text("Login is Success!")
                        .font(.headline)
                        .frame(width: 250, height: 80).cornerRadius(20).animation(Animation.default)
                }
            }
        }
    }
    
}


extension View{
    
    func googleSignInfo() {
        
        do {
            let clientId = "516444324421-7359v5mt4h2akcvqsgcg2vhebsrlc4kb.apps.googleusercontent.com"
            let signInConfig = GIDConfiguration(clientID: clientId)
            GIDSignIn.sharedInstance.signIn(with: signInConfig, presenting:getRootViewController()){ user, error in
                if let error = error {
                    print(error.localizedDescription)
                    return
                }
                guard user != nil else {return}
                goHome()
            } }
    }
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    // retrieve RootView
    func getRootViewController()->UIViewController{
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return . init()
        }
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }

    @ViewBuilder
    func googleBtn(isGoogle: Bool = false) -> some View {
        HStack {
            Image("Google")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 35, height: 32)
                .padding(10)
            Text("sigin with google")
                .foregroundColor(.black)
                .font(.title2)
            
        }
        .background(Color.white)
        .clipShape(Rectangle())
        .cornerRadius(70)
        .padding(.top,10)
    }
    
    public func goHome() {
        if let window = UIApplication.shared.windows.first {
            window.rootViewController = UIHostingController(rootView: spaceAPI())
            window.makeKeyAndVisible()
        }
    }
}
struct loginScreen_Previews: PreviewProvider {
    static var previews: some View {
        loginScreen()
    }
}

/*********Text*********************/
struct HelloText: View {
    var body: some View {
        VStack {
            Text("Hello you!")
                .font(.largeTitle)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .padding(.bottom,50)
        }
    }
}

/***************Login Button***************/

struct loginButtonContent : View {
    var body: some View {
        VStack {
            Text("Login").font(.title)
                .foregroundColor(.white).padding().frame(width:220, height: 60)
                .background(Color.blue)
                .cornerRadius(25)
                .padding(.top,20)
        }
    }
}

/***************userName**************/
struct  userNameTextField: View {
    @Binding var userName: String
    var body: some View {
        VStack {
            TextField("userName", text: $userName)
                .padding().background(lightGreyColour).cornerRadius(5.0).padding(.bottom,20)
        }
    }
}

/***************Password**************/
struct passwordSecureFeild : View {
    @Binding var password: String
    var body: some View {
        VStack {
            SecureField("password", text: $password).padding().background(lightGreyColour).cornerRadius(5.0).padding(.bottom,20)
        }
    }
}

