//
//  CustomWheelPickerConfig.swift
//  CustomWheelPicker
//
//  Created by Evgeniy Kugut on 23.10.2024.
//

import Foundation
import SwiftUI

public struct CustomWheelPickerConfig {
    let height: CGFloat
    let rowHeight: CGFloat
    let font: Font
    let fontWeight: Font.Weight
    let showDivider: Bool
}

extension CustomWheelPickerConfig {

    public static var defaultConfig: CustomWheelPickerConfig {
        .init(height: 300, rowHeight: 40, font: .body, fontWeight: .regular, showDivider: true)
    }

}
