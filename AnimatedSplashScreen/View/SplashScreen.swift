//
//  SplashScreen.swift
//  AnimatedSplashScreen
//
//  Created by Nik Kumbhani on 02/07/21.
//

import SwiftUI

struct SplashScreen<Content: View,Title: View,Logo: View,NavButton:View>: View {
    
    var content: Content
    var titleView: Title
    var logoView: Logo
    var navButton: NavButton
    
    var imageSize:CGSize
    
    
    init(imageSize: CGSize,@ViewBuilder content: @escaping () -> Content,@ViewBuilder titleView: @escaping () -> Title,@ViewBuilder logoView: @escaping () -> Logo,@ViewBuilder navButtons: @escaping () -> NavButton) {
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.imageSize = imageSize
        self.navButton = navButtons()
    }
    
    // Animation Properties
    @State var textAnimation = false
    @State var imageAnimation = false
    @State var endAnimation = false
    @State var showNavButtons = false
    
    // Name Space
    @Namespace var animation
    
    var body: some View {
        VStack(spacing:0){
            ZStack{
//                background(Color(.blue))
                Color(.purple)
                    .background(Color(.purple))
                    .ignoresSafeArea()
                
                    .overlay(
                        ZStack{
                            titleView
                                .scaleEffect(endAnimation ? 0.90 : 1)
                                .offset(y: textAnimation ? 0 : 110)
                            
                            if !endAnimation{
                                logoView
                                    .matchedGeometryEffect(id: "LOGO", in: animation)
                                    .frame(width: imageSize.width, height: imageSize.height)
                            }
                        }
                    )
               
                    .overlay(
                        // Moving Right
                        HStack{
                            // Nav Buttons...
                            navButton
                                .opacity(showNavButtons ? 1 : 0)
                                .padding()
                            
                            Spacer()
                            
                            if endAnimation{
                                logoView
                                    .matchedGeometryEffect(id: "LOGO", in: animation)
                                    .frame(width: 50, height: 50)
                                    .padding()
                            }
                        }
                    )
                
                
            }
            .frame(height: endAnimation ? 50 : nil)
            .zIndex(1)
            // Home View
            content
                .frame(height: endAnimation ? nil : 0)
                //moving back view
                .zIndex(0)
        }
        .frame(maxHeight:.infinity, alignment: .top)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                withAnimation(.spring()){
                    textAnimation.toggle()
                }
                
                withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 1, blendDuration: 1)){
                    endAnimation.toggle()
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
                    withAnimation{showNavButtons.toggle()}
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
