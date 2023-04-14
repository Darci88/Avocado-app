//
//  FactModel.swift
//  Avocados
//
//  Created by user219285 on 4/1/23.
//

import Foundation
import SwiftUI

struct Fact: Identifiable {
    var id = UUID()
    var image: String
    var content: String
}
