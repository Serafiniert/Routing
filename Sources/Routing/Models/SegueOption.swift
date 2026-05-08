//
//  SegueOption.swift
//  ArchitectureBootcamp
//
//  Created by Sera on 08.05.26.
//


public enum SegueOption {
    case push, sheet, fullScreenCover
    
    var shouldAddNewNavigationView: Bool {
        switch self {
        case .push: true
        case .sheet, .fullScreenCover: false
        }
    }
}
