//
//  SelectedPositionBackground.swift
//  CustomWheelPicker
//
//  Created by Evgeniy Kugut on 23.10.2024.
//

import SwiftUI

public struct SelectedPositionBackground: View {
    let config: CustomWheelPickerConfig
    var color: Color {
#if os(iOS)
        return Color(.systemGray5)
#elseif os(macOS)
        return Color(NSColor.unemphasizedSelectedContentBackgroundColor)
#endif
    }

    public init(config: CustomWheelPickerConfig = .defaultConfig) {
        self.config = config
    }

    public var body: some View {
        color
            .opacity(0.8)
            .cornerRadius(8)
            .frame(height: config.rowHeight + 10)
    }
}
