//
//  WheelPickerDataSource.swift
//  CustomWheelPicker
//
//  Created by Evgeniy Kugut on 23.10.2024.
//

import Foundation

public protocol WheelPickerDataSource {
    associatedtype T: Hashable
    var initialSelection: T { get set }
    func item(at offset: Int) -> T?
    func offset(of item: T) -> Int?
    func translationOffset(to item: T, origin: Int) -> Int
    func limitDegreesTranslation(_ rawTranslation: Double, draggingStartOffset: Int?) -> Double
    func maxTranslation(draggingStartOffset: Int?) -> Double
    func minTranslation(draggingStartOffset: Int?) -> Double
}
