//
//  ModalSupportView.swift
//  ArchitectureBootcamp
//
//  Created by Sera on 08.05.26.
//

import SwiftUI

struct ModalSupportView<Content: View>: View {
    var backgroundColor: Color
    var transition: AnyTransition
    @Binding var isShowingModal: Bool
    @ViewBuilder var content: Content
    
    var body: some View {
        ZStack {
            if isShowingModal {
                backgroundColor
                    .ignoresSafeArea()
                    .transition(.opacity.animation(.smooth))
                    .onTapGesture {
                        isShowingModal = false
                    }
                    .zIndex(1)
                
                content
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .ignoresSafeArea()
                    .transition(transition)
                    .zIndex(2)
            }
        }
        .zIndex(999)
        .animation(.bouncy, value: isShowingModal)
    }
}

extension View {
    func modalViewModifier(backgroundColor: Color, transition: AnyTransition, screen: Binding<AnyDestination?>) -> some View {
        self
            .overlay {
                ModalSupportView(backgroundColor: backgroundColor, transition: transition, isShowingModal: Binding(ifNotNil: screen)) {
                    ZStack {
                        if let screen = screen.wrappedValue {
                            screen.destination
                        }
                    }
                }
            }
    }
}
