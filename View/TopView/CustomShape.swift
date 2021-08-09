//
//  CustomShape.swift
//  CustomShape
//
//  Created by nyannyan0328 on 2021/08/09.
//

import SwiftUI

struct CustomShape: Shape {
    
    let corner : UIRectCorner
    let radi : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radi, height: radi))
        
        return Path(path.cgPath)
    }
}

