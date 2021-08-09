//
//  TopMain.swift
//  TopMain
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI

struct TopMain: View {
    
    let max = UIScreen.main.bounds.height < 750 ? (UIScreen.main.bounds.height / 1.9) : (UIScreen.main.bounds.height / 2.3)
    
    @State var offset : CGFloat = 0
    var topEdge : CGFloat
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing:10){
                
                GeometryReader{proxy in
                    
                    TopBar(offset: $offset, topEdge: topEdge, maxH: max)
                        .frame(maxWidth: .infinity)
                        .frame(height: getHeaderOffset(), alignment: .bottom)
                    .background(Color("bg"),in: CustomShape(corner: [.bottomLeft,.bottomRight], radi: getRai()))
                    .overlay(
                    
                        TopNavBar(offset: $offset, topEdge: topEdge, max: max)
                            .padding(.horizontal)
                            .frame(height: 80)
                            .padding(.top,topEdge)
                    
                        ,alignment: .top
                    )
                    
                    
                }
                .frame(height: max)
                .offset(y: -offset)
                .zIndex(1)
                
                VStack(spacing:15){
                    
                    ForEach(messages){msg in
                        
                        
                        MessageCardView(msg: msg)
                        
                    }
                }
                .padding()
                .zIndex(0)
                
            }
            .modifier(OffsetModifier(offset: $offset))
        }
        .coordinateSpace(name: "SCROL")
    }
    func getHeaderOffset()->CGFloat{
        
        
        let topH = max + offset
        
        return topH > (80 + topEdge) ? topH : (80 + topEdge)
    }
    
    func getRai()->CGFloat{
        
        
        let progress = -offset / (max - (80 + topEdge))
        
        let value = 1 - progress
        
        let radi = value * 50
        
        return offset < 0 ? radi : 50
    }
    
}

struct TopMain_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TopBar : View{
    
    @Binding var offset : CGFloat
    var topEdge : CGFloat
    var maxH : CGFloat
    
    var body: some View{
        
        VStack(alignment: .leading, spacing: 15) {
            
            
            Image("p1-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            
            ScrollView(.vertical, showsIndicators: false) {
                
                Text("Deer or true deer are hoofed ruminant mammals forming the family Cervidae. The two main groups of deer are the Cervinae, including the muntjac, the elk (wapiti), the red deer, the fallow deer, and the chital; and the Capreolinae, including the reindeer (caribou), the roe deer, the mule deer, and the moose. Female reindeer, and male deer of all species except the Chinese water deer, grow and shed new antlers each year. In this they differ from permanently horned antelope, which are part of a different family (Bovidae) within the same order of even-toed ungulates (Artiodactyla).")
                    .font(.footnote.italic())
                
            }
            .frame(height: 120)
            
        }
        .padding()
        .padding(.bottom,10)
        .opacity(getOpacity())
    }
    
    func getOpacity()->CGFloat{
        
        
        let progress = -offset / 70
        
        let opa = 1 - progress
        
        return offset < 0 ? opa : 1
        
    
    }
    
    
}

struct TopNavBar : View{
    
    @Binding var offset : CGFloat
    var topEdge : CGFloat
    var max : CGFloat
    
    
    @State var line = "A"
    
    var body: some View{
        
        HStack{
            
            Button {
                
            } label: {
                Image(systemName: "xmark")
                    .font(.title.bold())
                    .foregroundColor(.black)
                    .padding(5)
                    .background(.gray,in: Capsule())
            }
            
            Image("p1-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                .clipShape(Circle())
                .opacity(tabButtonOpacity())
            
            
            
            Spacer()
            
            
            Menu(content: {
                
                Button {
                    
                    withAnimation{
                        
                        line = "A"
                        
                    }
                } label: {
                    
                    Text("A")
                    
                }
                
                Button {
                    
                    withAnimation{
                        
                        line = "B"
                        
                    }
                } label: {
                    
                    Text("B")
                    
                }
                
                Button {
                    
                    withAnimation{
                        
                        line = "C"
                        
                    }
                } label: {
                    
                    Text("C")
                    
                }

                
                
            }) {
                
                
                Label {
                    
                    Text(line)
                        .font(.title3)
                        .offset(x: -5)
                } icon: {
                    
                    Image(systemName: "line.3.horizontal.decrease")
                }

            }
            .foregroundColor(.white)
            .padding(.vertical,5)
            .padding(.horizontal,5)
            .background(.black,in: Capsule())
            
           
            


            
            
            
        }
    }
    
    func tabButtonOpacity()->CGFloat{
        
        
        let progress = -(offset + 60) / (max - (80 + topEdge))
        return progress
    }
}

struct MessageCardView : View{
    
    var msg : Message
    
    var body: some View{
        
        HStack{
            
            Circle()
                .fill(msg.color)
                .frame(width: 50, height: 50)
                .opacity(0.8)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text(msg.userName)
                    .font(.title.bold())
                    .foregroundColor(.blue)
                    
                
                Text(msg.message)
                    .font(.footnote.italic())
                
                
            }
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}


