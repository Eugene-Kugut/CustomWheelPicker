//
//  CustomCircularWheelPicker.swift
//  CustomWheelPicker
//
//  Created by Evgeniy Kugut on 23.10.2024.
//

import SwiftUI

public struct CustomCircularWheelPicker<V: Hashable, Label: View>: View {
    @Binding var selection: V
    @State private var dataSource: CircularWheelPickerDataSource<V>
    var accessibilityText: ((V) -> String)?
    var label: (V?) -> Label
    private let config: CustomWheelPickerConfig

    public init(selection: Binding<V>, items: [V], accessibilityText: ((V) -> String)? = nil, @ViewBuilder label: @escaping (V?) -> Label, config: CustomWheelPickerConfig = .defaultConfig) {
        self.config = config
        let dataSource = CircularWheelPickerDataSource(items: items, initialSelection: selection.wrappedValue)
        _selection = selection
        _dataSource = State(initialValue: dataSource)
        self.accessibilityText = accessibilityText
        self.label = label
    }

    public var body: some View {
        CustomWheelPicker(selection: $selection, dataSource: dataSource, label: label, config: config)
            .accessibilityElement()
            .accessibilityValue(accessibilityText?(selection) ?? "")
            .accessibilityAdjustableAction { direction in
                switch direction {
                case .increment:
                    guard let offset = dataSource.offset(of: selection),
                          let newValue = dataSource.item(at: offset + 1) else { return }
                    selection = newValue
                case .decrement:
                    guard let offset = dataSource.offset(of: selection),
                          let newValue = dataSource.item(at: offset - 1) else { return }
                    selection = newValue
                @unknown default:
                    return
                }
            }
    }
}
