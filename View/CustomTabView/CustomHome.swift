//
//  CustomHome.swift
//  CustomHome
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI

struct CustomHome: View {
    @Namespace var animation
    @State var currentTab : Tab = .Setting
    
    init(size : CGSize,bottomEdge : CGFloat) {
        self.size = size
        self.bottomEdge = bottomEdge
        
        UITabBar.appearance().isHidden = true
    }
    
    var size : CGSize
    var bottomEdge : CGFloat
    var body: some View {
        ZStack(alignment: .bottom) {
            
            TabView(selection:$currentTab){
                
                SplashMainView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                   // .background(Color.black.opacity(0.05).ignoresSafeArea())
                    .tag(Tab.Home)
                
               AnimationMain()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.05).ignoresSafeArea())
                    .tag(Tab.Search)
                
                CircleMainView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.black.opacity(0.05).ignoresSafeArea())
                    .tag(Tab.Liked)
                
                GeometryReader{proxy in
                    
                    let top = proxy.safeAreaInsets.top
                    
                    TopMain(topEdge: top)
                        .ignoresSafeArea(.all, edges: .top)
                    
                    
                }
                   
                    .tag(Tab.Setting)
            }
            
            CustomTabBar(size: size, bottomEdge: bottomEdge, current: $currentTab, animation: animation)
                .background(.white)
            
        }
    }
}

struct CustomHome_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
enum Tab : String,CaseIterable{
    
    
    case Home = "house.fill"
    case Search = "magnifyingglass"
    case Liked = "suit.heart.fill"
    case Setting = "gearshape"
}
