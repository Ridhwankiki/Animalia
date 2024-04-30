//
//  VideoPlayerView.swift
//  Animalia
//
//  Created by MacBook Pro on 30/04/24.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    var videoSelected: String
    var videoTitle: String
    
    var body: some View {
        Group {
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
            }
            .overlay (
                Image(.logo)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .padding(.top)
                    .padding(.horizontal), alignment: .topLeading
        )
        }
        .navigationTitle(videoTitle)
    }
}

#Preview {
    VideoPlayerView(videoSelected: "cheetah", videoTitle: "Cheetah")
}
