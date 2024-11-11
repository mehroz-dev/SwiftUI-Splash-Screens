//
//  Home.swift
//  AnimatedSplashScreen
//
//  Created by Nik Kumbhani on 30/07/21.
//

import SwiftUI

struct Home: View {
    @State var currentTab = "Media"
    @Namespace var animation
    var body: some View {
        VStack{
            HStack(spacing :0){
                TabButton(title: "Media", animation: animation, currentTab: $currentTab)
                TabButton(title: "Status", animation: animation, currentTab: $currentTab)
                TabButton(title: "Chats", animation: animation, currentTab: $currentTab)
                
            }
            .padding(.top,20)
            .background(Color(.purple))

            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing :15){
                    if currentTab == "Media"{
                    ForEach(1...6,id : \.self){ index in
                        Image("post\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 30, height: (UIScreen.main.bounds.width - 30) / 2)
                            .cornerRadius(8.0)
                    }
                    }else{
                        Text(currentTab)
                            .font(.system(size: 35).bold())
                            .foregroundColor(Color(.purple))
                            .frame(width: UIScreen.main.bounds.width - 30,alignment: .center)
                            .padding(.top,300)
                    }
                }
            })
            .padding(15)
        }
        .background(Color(.quaternaryLabel))
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

// Tab Bar Button...
struct TabButton: View{
    var title: String
    var animation:Namespace.ID
    @Binding var currentTab: String
    
    var body: some View{
        Button{
            withAnimation (.spring()){
                currentTab = title
            }
        } label:{
            VStack{
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                // Slider
                ZStack{
                    if currentTab == title{
                        Capsule()
                            .fill()
                            .shadow(radius: 15)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .foregroundColor(.white)
                            .frame(height: 3.5)
                        
                    }else{
                        Capsule()
                            .fill()
                            .foregroundColor(.clear)
                            .frame(height: 3.5)
                    }
                }
            }
        }
    }
}
