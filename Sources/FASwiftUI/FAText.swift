//
//  FAText.swift
//  link-swiftui
//
//  Created by Matt Maddux on 10/1/19.
//  Copyright © 2019 Matt Maddux. All rights reserved.
//

import SwiftUI

public struct FAText: View {
    
    var iconName: String
    private var icon: FAIcon {
        return FontAwesome.shared.icon(byName: iconName) ?? FontAwesome.shared.icon(byName: "question-square")!
    }
    var size: CGFloat
    var style: FAStyle?
    private var weight: Font.Weight {
        if let style = style {
            return style.weight
        } else {
            return .regular
        }
    }
    
    public init(iconName: String, size: CGFloat, style: FAStyle? = nil) {
        self.iconName = iconName.hasPrefix("fa-") ? String(iconName.dropFirst(3)) : iconName
        self.size = size
        self.style = style
    }
    
    public var body: some View {
        Text(icon.unicodeString)
            .font(Font.custom(icon.collection.rawValue, size: size))
            .fontWeight(weight)
    }
}
