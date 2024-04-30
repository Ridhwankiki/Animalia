//
//  VideoModel.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import SwiftUI

struct VideoModel: Codable, Identifiable {
    var id: String
    var name: String
    var headline: String
    
    // MARK: - Computed Property
    var thumbnail: String {
        "video-\(id)"
    }
}
