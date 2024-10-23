//
//  SelectionFeedbackGenerator.swift
//  CustomWheelPicker
//
//  Created by Evgeniy Kugut on 23.10.2024.
//

import Foundation
import SwiftUI
import AudioToolbox

class SelectionFeedbackGenerator {

#if os(iOS)
    private let generator = {
        let generator = UISelectionFeedbackGenerator()
        generator.prepare()
        return generator
    }()
#endif

    func generateFeedback() {
        AudioServicesPlaySystemSoundWithCompletion(1157, nil)
#if os(iOS)
        generator.selectionChanged()
#endif
    }

}
