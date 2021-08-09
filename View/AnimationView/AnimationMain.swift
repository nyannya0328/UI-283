//
//  AnimationMain.swift
//  AnimationMain
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI
import Lottie

struct AnimationMain: View {
    @State var show : Bool = false
    
    @State var text = ""
    var body: some View {
      
            
            ZStack{
                
              
                
                LinearGradient(colors: [
                
                
                Color("BG1"),
                .clear
                ], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                Animation(show: $show)
                    .scaleEffect(0.7)
                    .frame(height: getRect().height / 1.5)
                  
                    
                 
                
                
                    .overlay(
                    
                        HStack{
                            
                            
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                
                                Text("Login")
                                    .font(.title2.bold())
                                
                                Text("Enter your nember")
                                    .font(.title.bold())
                                
                                
                                HStack{
                                    
                                    Text("+1")
                                        .foregroundColor(.black)
                                    
                                    TextField("", text: $text)
                                        .font(.system(size: 18, weight: .light))
                                    
                                 
                                }
                                
                                Divider()
                                
                                Button {
                                    
                                } label: {
                                    Text("Veri fire Number")
                                        .font(.title.bold())
                                        .foregroundColor(.black)
                                        .padding(.vertical,8)
                                        .padding(.horizontal,3)
                                        .frame(maxWidth: .infinity)
                                        .background(Color.red.opacity(0.3),in: Capsule())
                                }

                                
                                
                                HStack{
                                    
                                    Rectangle()
                                        .fill(.black)
                                        .frame(height: 3)
                                    
                                    Text("or")
                                    
                                    Rectangle()
                                        .fill(.black)
                                        .frame(height: 3)
                                    
                                    
                                    
                                }
                                
                                
                                HStack{
                                    
                                    
                                    Button {
                                        
                                    } label: {
                                        Image("google-symbol")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 30, height: 30)
                                        
                                        
                                        Text("Sign in With Goole")
                                    }
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(.green,in: RoundedRectangle(cornerRadius: 10))
                                    .frame(maxWidth: .infinity)
                                    
                                    Button {
                                        
                                    } label: {
                                        Image("email")
                                            .resizable()
                                            .renderingMode(.original)
                                            .frame(width: 30, height: 30)
                                        
                                        
                                        Text("Sign in With Email")
                                    }
                                    .padding(.vertical,10)
                                    .padding(.horizontal)
                                    .background(.purple,in: RoundedRectangle(cornerRadius: 10))
                                    .frame(maxWidth: .infinity)

                                    
                                }
                                .padding(.horizontal)
                                
                                Divider()
                              

                                
                                
                                
                                
                                
                            }
                            .padding()
                            .background(Color("blue").opacity(0.3),in: RoundedRectangle(cornerRadius: 10))
                            
                            
                        }
                       
                        .padding()
                      .opacity(show ? 1 : 0)
                        .scaleEffect(getDevice() == .iPhone ? 0.6 : 1)
                            .offset(y: 200)
                            .padding(.horizontal)
                    
                    
                        ,alignment: .bottom
                    )
                    
                       
                       
                       
                    
                
             
                    
                    
            }
            .padding(.bottom,100)
           
            
      
       
    }
}

struct AnimationMain_Previews: PreviewProvider {
    static var previews: some View {
        AnimationMain()
    }
}


struct Animation : UIViewRepresentable{
    
    @Binding var show : Bool
    
    let animation = AnimationView(name: "63142-bike",bundle: .main)
    func makeUIView(context: Context) -> AnimationView {
        
        
        animation.play { statas in
            if statas{
                
                
                withAnimation{
                    
                    show.toggle()
                }
            }
        }
        
        return animation
        
    }
    func updateUIView(_ uiView: AnimationView, context: Context) {
        
        
    }
}


