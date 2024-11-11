//
//  ContentView.swift
//  AnimatedSplashScreen
//
//  Created by Nik Kumbhani on 02/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SplashScreen(imageSize: CGSize(width: 150, height: 150)){
            // Home View
            Home()
            
        } titleView: {
            Text("Let's Talk")
                .font(.system(size: 25).bold())
                .foregroundColor(.white)
        } logoView: {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
        } navButtons: {
            // Navigation Bar Buttons
            Button {
                
            } label:{
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
