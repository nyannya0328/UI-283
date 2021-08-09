//
//  SplashScreen.swift
//  SplashScreen
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI

struct SplashScreen<Content : View,TitleView : View,LogoView : View>: View {
    var content : Content
    var titleView : TitleView
    var logoView : LogoView
    var imageSize : CGSize
    
    init(imageSize : CGSize, @ViewBuilder content : @escaping()->Content,@ViewBuilder titleView : @escaping()->TitleView,@ViewBuilder logoView : @escaping()->LogoView){
        
        self.content = content()
        self.titleView = titleView()
        self.logoView = logoView()
        self.imageSize = imageSize
        
        
        
    }
    
    @State var textAnimation = false
    @State var EndAnimation = false
    
    @Namespace var animation
    var body: some View {
        VStack(spacing:0){
            
            ZStack{
                
                
                Color("blue")
                    .background(Color("blue"))
                
                titleView
                    .offset(y:textAnimation ? -10 : 120)
                    .scaleEffect(EndAnimation ? 0.7 : 1)
                
                if !EndAnimation{
                    
                    logoView
                        .matchedGeometryEffect(id: "LOGO", in: animation)
                        .frame(width: imageSize.width, height: imageSize.height)
                }
                
                HStack{
                    
                    Spacer()
                    
                    if EndAnimation{
                        
                        logoView
                            .matchedGeometryEffect(id: "LOGO", in: animation)
                            .frame(width: 50, height: 50)
                            .offset(y: -10)
                    }
                }
                
            }
            .frame(height: EndAnimation ? 60 : nil)
            .tag(1)
            
            content
                .tag(0)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4){
                
                withAnimation{
                    
                    textAnimation.toggle()
                }
                
                
                withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 1)){
                    
                    EndAnimation.toggle()
                }
            }
           
        }
        
        
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashMainView()
    }
}
