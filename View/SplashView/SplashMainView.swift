//
//  SplashMainView.swift
//  SplashMainView
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI

struct SplashMainView: View {
    var body: some View {
        SplashScreen(imageSize: CGSize(width: 150, height: 150)){
            
            SplashHome()
            
        } titleView: {
            
            Text("Chatty")
                .font(.title.italic())
                .foregroundColor(.black)
            
        } logoView: {
            
            Image("logo")
                .resizable()
                .renderingMode(.original)
               
                
            
        }

    }
}

struct SplashMainView_Previews: PreviewProvider {
    static var previews: some View {
        SplashMainView()
    }
}
