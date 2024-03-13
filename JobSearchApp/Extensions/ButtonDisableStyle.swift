//
//  ButtonDisableStyle.swift
//  JobSearchApp
//
//  Created by Anatolii Shumov on 13.03.2024.
//

import SwiftUI

struct DisabledButton: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  func makeBody(configuration: Configuration) -> some View {
    configuration.label
          .foregroundStyle(isEnabled ? Color.grey4 : Color.grey4.opacity(0.5))
  }
}
