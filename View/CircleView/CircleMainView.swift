//
//  CircleMainView.swift
//  CircleMainView
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI

struct CircleMainView: View {
    var body: some View {
        ZStack{
            
            
            LinearGradient(colors: [
            
                Color("BG1"),
                Color("BG2")
            
            
            
            ], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            
            GeometryReader{proxy in
                
                
                let size = proxy.size
                
                Color.black.opacity(0.05)
                    .ignoresSafeArea()
                
                Circle()
                    .fill(Color("Purple"))
                    .padding(50)
                    .blur(radius: 100)
                    .offset(x: -size.width / 1.8, y: -size.height / 2)
                
                Circle()
                    .fill(Color("blue"))
                    .padding(50)
                    .blur(radius: 100)
                    .offset(x: size.width / 1.8, y: -size.height / 2)
                
                Circle()
                    .fill(Color("blue"))
                    .padding(50)
                    .blur(radius: 90)
                    .offset(x: size.width / 1.8, y: size.height / 2)
                
                
                Circle()
                    .fill(Color("LightBlue"))
                    .padding(50)
                    .blur(radius: 150)
                    .offset(x: size.width / 1.8, y: size.height / 2)
                
                Circle()
                    .fill(Color("Purple"))
                    .padding(50)
                    .blur(radius: 150)
                    .offset(x: -size.width / 1.8, y: size.height / 2)
            }
            
            
            VStack{
                
                Spacer(minLength: 0)
            
                ZStack{
                    
                    Circle()
                        .fill(Color("LightBlue"))
                        .frame(width: 100, height: 100)
                        .blur(radius: 20)
                        .offset(x: 100, y: -120)
                    
                    
                    Circle()
                        .fill(Color("Purple"))
                        .frame(width: 100, height: 100)
                        .blur(radius: 20)
                        .offset(x: -100, y: 120)
                    
                Glass()
                }
                
                Spacer(minLength: 0)
                
                
                Text("**Know Everything\nabout the weather**")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Text(getAttribute())
                    .font(.title3.bold())
                    .padding(.top,10)
                
                
                Button {
                    
                } label: {
                    Text("Get Started")
                        .font(.largeTitle.bold())
                        .foregroundColor(.white.opacity(0.3))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical,10)
                        .padding(.horizontal,10)
                        .background(
                            
                            LinearGradient(colors: [
                            
                            
                        Color("Button11"),
                        Color("Button12"),
                        Color("Button12").opacity(0.3)
                        
                        
                            
                            ], startPoint: .leading, endPoint: .trailing)
                            
                            
                            ,in: RoundedRectangle(cornerRadius: 20))
                }
                .padding(.bottom,10)

                
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            
            
            
        }
        .padding(.bottom,100)
    }
    func getAttribute()->AttributedString{
        
        
        
        var atR = AttributedString("The most beautiful Image for unsplash")
        atR.foregroundColor = .gray
        
        
        if let range = atR.range(of: "unsplash"){
            
            atR[range].foregroundColor = .blue
            atR[range].link = URL(string: "https://unsplash.com")
            
        }
        
        return atR
    }
}

struct CircleMainView_Previews: PreviewProvider {
    static var previews: some View {
        CircleMainView()
    }
}

struct Glass : View{
    
    var body: some View{
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .opacity(0.1)
                .background(
                    Color.white.opacity(0.08)
                        .blur(radius: 10)
                
                )
                .background(
                
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(
                    
                    
                        LinearGradient(colors: [
                        
                        Color("Purple"),
                        Color("Purple").opacity(0.5),
                        .clear,
                        .clear,
                        Color("LightBlue")
                        
                        
                        ], startPoint: .topLeading, endPoint: .bottomTrailing),lineWidth: 3
                    
                        
                    
                    )
                    .padding(2)
               
                
                   
                
                )
                .shadow(color: .black.opacity(0.3), radius: 5, x: -5, y: -5)
                .shadow(color: .black.opacity(0.3), radius: 5, x: 5, y: 5)
            
            
            VStack{
                
                
                Image(systemName: "sun.max")
                    .font(.system(size: 70, weight: .bold))
                    .foregroundColor(.red.opacity(0.3))
                
                
                Text("20")
                    .font(.system(size: 85, weight: .bold))
                    .foregroundColor(.white)
                    .overlay(
                    
                    Text("C")
                        .font(.title.bold())
                        .foregroundColor(.blue)
                        .offset(x: 10, y: -5)
                    ,alignment: .topTrailing
                    
                    )
                
                
                Text("Tokyo")
                    .font(.system(size: 30, weight: .thin))
                    .foregroundColor(.white)
                    .background(
                    
                        LinearGradient(colors: [.red.opacity(0.05),.blue.opacity(0.1)], startPoint: .leading, endPoint: .trailing)
                    )
                    
            }
                
            
            
            
                
            
            
        }
        .frame(width: getRect().width / 1.7, height: 270)
    }
}
