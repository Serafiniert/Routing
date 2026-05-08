//
//  SheetViewModifier.swift
//  ArchitectureBootcamp
//
//  Created by Sera on 08.05.26.
//

import SwiftUI

extension View {
    func sheetViewModifier(screen: Binding<AnyDestination?>) -> some View {
        self
            .sheet(isPresented: Binding(ifNotNil: screen)) {
                ZStack {
                    if let screen = screen.wrappedValue {
                        screen.destination
                    }
                }
            }
    }
    
    func fullScreenCoverViewModifier(screen: Binding<AnyDestination?>) -> some View {
        self
            .fullScreenCover(isPresented: Binding(ifNotNil: screen)) {
                ZStack {
                    if let screen = screen.wrappedValue {
                        screen.destination
                    }
                }
            }
    }
}
