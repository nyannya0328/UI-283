//
//  SplashHome.swift
//  SplashHome
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI

struct SplashHome: View {
    @State var selectedSplash = "All Photo"
    @Namespace var animation
    var body: some View {
        VStack(spacing:0){
            
            HStack(spacing:0){
                
                
                ForEach(["All Photo","Chat","Statas"],id:\.self){splash in
                    
                    
                    SplashButton(title: splash, animation: animation, selectedSplash: $selectedSplash)
                }
                
                
            }
            .padding(.bottom,10)
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(spacing:15){
                    
                    ForEach(1...6,id:\.self){index in
                        
                        
                        Image("p\(index)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: getRect().width - 30, height: 250)
                            .cornerRadius(10)
                        
                        
                    }
                    
                }
                
                
            }
        }
        .background(.quaternary)
    }
}

struct SplashHome_Previews: PreviewProvider {
    static var previews: some View {
        SplashHome()
    }
}

struct SplashButton : View{
    
    var title : String
    var animation : Namespace.ID
    
    @Binding var selectedSplash : String
    
    var body: some View{
        
        Button {
            withAnimation{
                
                selectedSplash = title
            }
        } label: {
            
            
            VStack{
                
                Text(title)
                    .font(.title.bold())
                    .foregroundColor(selectedSplash == title ? Color("blue") : .gray)
                
                ZStack{
                    
                    if selectedSplash == title{
                        Rectangle()
                            .fill(Color("blue"))
                            .frame(height: 3)
                            .matchedGeometryEffect(id: "SPLASH", in: animation)
                        
                        
                    }
                    else{
                        
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 3)
                        
                    }
                    
                    
                }
                
                
            }
            
            
            
            
            
        }

    }
    
}


