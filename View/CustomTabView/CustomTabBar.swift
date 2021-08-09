//
//  CustomTabBar.swift
//  CustomTabBar
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI

struct CustomTabBar: View {
    var size : CGSize
    var bottomEdge : CGFloat
    @Binding var current : Tab
    var animation : Namespace.ID
    
    @State var startAnimation : Bool = false
    var body: some View {
        HStack(spacing:0){
            
            ForEach(Tab.allCases,id:\.rawValue){tab in
                
                
                TabButton(tab: tab, animation: animation, selected: $current) { pressTab in
                    
                    
                    withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 1)){
                        
                        startAnimation  = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                        
                        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 1)){
                            
                            current = pressTab
                        }
                        
                        
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
                        
                        withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 0.8, blendDuration: 1)){
                            
                           startAnimation = false
                        }
                        
                        
                    }
                }
                
                
            }
        }
        .background(
            
            ZStack{
                
                
                let satartAnimationoffset : CGFloat = (startAnimation ? (startAnimation ? 15 : 18) : (bottomEdge == 0 ? 26 : 27))
                
                
                let offset : CGSize = bottomEdge == 0 ? CGSize(width: satartAnimationoffset, height: 31) : (CGSize(width: satartAnimationoffset, height: 37))
                
                
                Circle()
                    .fill(Color("blue"))
                    .frame(width: 50, height: 50)
                    .offset(y: 40)
                
                
                Circle()
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                    .offset(x: offset.width, y: offset.height)
                
                Circle()
                    .fill(.white)
                    .frame(width: 50, height: 50)
                    .scaleEffect(bottomEdge == 0 ? 0.8 : 1)
                    .offset(x: -offset.width, y: offset.height)
            }
                .offset(x: centerOffset())
                .offset(x: getOffset())
            ,alignment: .leading
        
        
        
        )
        .padding(.horizontal,15)
        .padding(.top,5)
        .padding(.bottom,bottomEdge == 0 ? 15 : bottomEdge)
    }
    
    func centerOffset()->CGFloat{
        
        let reduced = (size.width - 30) / 4
        let center = (reduced - 50) / 2
        
        return center
        
    }
    
    func getOffset()->CGFloat{
        
        let deduced = (size.width - 30) / 4
        
        let index = Tab.allCases.firstIndex { currentTab in
            return currentTab == current
        } ?? 0
        
        return deduced * CGFloat(index)
        
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
          
    }
}

struct TabButton : View{
    
    
    var tab : Tab
    var animation : Namespace.ID
    @Binding var selected : Tab
    
    var ontap : (Tab)->()
    
    var body: some View{
        
        
        Image(systemName: tab.rawValue)
            .foregroundColor(selected == tab ? .white : .gray)
            .frame(width: 50, height: 50)
            .background(
            
                ZStack{
                    
                    if selected == tab{
                        
                        Circle()
                            .fill(Color("blue"))
                            .matchedGeometryEffect(id: "TAB", in: animation)
                        
                    }
                }
            
            
            )
            .contentShape(Rectangle())
            .frame(maxWidth: .infinity)
            .onTapGesture {
                if selected != tab{
                    
                    ontap(tab)
                    
                }
            }
        
    }
    
}
