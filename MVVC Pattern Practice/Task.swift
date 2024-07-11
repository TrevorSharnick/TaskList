//
//  Task.swift
//  MVVC Pattern Practice
//
//  Created by Trevor Sharnick on 7/11/24.
//

import Foundation

// MODEL: represents the data
struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool = false
}
