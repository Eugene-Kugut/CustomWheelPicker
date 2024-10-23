//
//  CustomWheelPickerConfig.swift
//  CustomWheelPicker
//
//  Created by Evgeniy Kugut on 23.10.2024.
//

import Foundation
import SwiftUI

public struct CustomWheelPickerConfig {
    public let height: CGFloat
    public let rowHeight: CGFloat
    public let font: Font
    public let fontWeight: Font.Weight
    public let showDivider: Bool
}

extension CustomWheelPickerConfig {

    public static var defaultConfig: CustomWheelPickerConfig {
        .init(height: 300, rowHeight: 40, font: .body, fontWeight: .regular, showDivider: true)
    }

}
