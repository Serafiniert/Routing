//
//  AnyDestination.swift
//  ArchitectureBootcamp
//
//  Created by Sera on 08.05.26.
//

import SwiftUI

// Safety: only created and accessed within @MainActor-isolated SwiftUI view code
public struct AnyDestination: Hashable, @unchecked Sendable {
    
    let id = UUID().uuidString
    var destination: AnyView
    
    init<T: View>(destination: T) {
        self.destination = AnyView(destination)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    public static func == (lhs: AnyDestination, rhs: AnyDestination) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
}
