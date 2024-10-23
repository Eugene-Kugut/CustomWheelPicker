//
//  FiniteWheelPickerDataSource.swift
//  CustomWheelPicker
//
//  Created by Evgeniy Kugut on 23.10.2024.
//

import Foundation

public struct FiniteWheelPickerDataSource<T: Hashable>: WheelPickerDataSource {
    public var items: [T]
    public var initialSelection: T

    public init(items: [T], initialSelection: T) {
        self.items = items
        self.initialSelection = initialSelection
    }

    public func item(at offset: Int) -> T? {
        guard let initialSelectionIndex = items.firstIndex(of: initialSelection) else { return nil }
        let itemIndex = initialSelectionIndex + offset
        guard (0..<items.count).contains(itemIndex) else { return nil }
        return items[itemIndex]
    }

    public func offset(of item: T) -> Int? {
        guard let initialSelectionIndex = items.firstIndex(of: initialSelection),
              let itemIndex = items.firstIndex(of: item) else { return nil }
        return itemIndex - initialSelectionIndex
    }

    public func translationOffset(to item: T, origin: Int) -> Int {
        guard let offset = offset(of: item) else { return 0 }
        return offset - origin
    }

    public func limitDegreesTranslation(_ rawTranslation: Double, draggingStartOffset: Int?) -> Double {
        let maxTranslation = maxTranslation(draggingStartOffset: draggingStartOffset)
        let minTranslation = minTranslation(draggingStartOffset: draggingStartOffset)
        return min(max(rawTranslation, minTranslation), maxTranslation)
    }

    public func maxTranslation(draggingStartOffset: Int?) -> Double {
        guard let initialSelectionIndex = items.firstIndex(of: initialSelection),
              let draggingStartOffset = draggingStartOffset else { return 0 }
        let draggingStartIndex = initialSelectionIndex + draggingStartOffset
        return Double(draggingStartIndex * 18)
    }

    public func minTranslation(draggingStartOffset: Int?) -> Double {
        guard let initialSelectionIndex = items.firstIndex(of: initialSelection),
              let draggingStartOffset = draggingStartOffset else { return 0 }
        let draggingStartIndex = initialSelectionIndex + draggingStartOffset
        return -Double(items.count - draggingStartIndex - 1) * 18
    }
}
