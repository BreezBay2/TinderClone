//
//  ScreenDimensions.swift
//  TinderClone
//
//  Created by Taro Altrichter on 03.09.24.
//

import SwiftUI

struct ScreenDimensions {
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
    
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 1.3
    }
}
