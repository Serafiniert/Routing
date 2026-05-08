//
//  AlertViewModifier.swift
//  ArchitectureBootcamp
//
//  Created by Sera on 08.05.26.
//

import SwiftUI

extension View {
    @ViewBuilder
    func showCustomAlert(alert: Binding<AnyAppAlert?>, type: AlertType = .alert) -> some View {
        switch type {
        case .alert:
            self
                .alert(alert.wrappedValue?.title ?? "", isPresented: Binding(ifNotNil: alert)) {
                    alert.wrappedValue?.buttons()
                } message: {
                    if let subtitle = alert.wrappedValue?.subtitle {
                        Text(subtitle)
                    }
                }
        case .confirmationDialog:
            confirmationDialog(alert.wrappedValue?.title ?? "", isPresented: Binding(ifNotNil: alert)) {
                alert.wrappedValue?.buttons()
            } message: {
                if let subtitle = alert.wrappedValue?.subtitle {
                    Text(subtitle)
                }
            }
        }
    }
}
