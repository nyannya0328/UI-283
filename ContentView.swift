//
//  ContentView.swift
//  UI-283
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI
import Lottie

struct ContentView: View {
    var body: some View {
        GeometryReader{proxy in

            let size = proxy.size
            let bottomEdge = proxy.safeAreaInsets.bottom

            CustomHome(size: size, bottomEdge: bottomEdge)
                .ignoresSafeArea(.all, edges: .bottom)
        }
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    
    func getDevice()->Deivice{
        
#if os(iOS)
        
        if UIDevice.current.model.contains("iPad"){
            
            return .iPad
        }
        else{
            
            return .iPhone
        }
        
        
        #endif
    }
}

enum Deivice{
    
    case iPhone
    case iPad
}

