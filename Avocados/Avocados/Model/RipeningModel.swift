//
//  RipeningModel.swift
//  Avocados
//
//  Created by user219285 on 4/1/23.
//

import Foundation
import SwiftUI

struct Ripening: Identifiable {
    var id = UUID()
    var image: String
    var stage: String
    var title: String
    var description: String
    var ripeness: String
    var instruction: String
}
