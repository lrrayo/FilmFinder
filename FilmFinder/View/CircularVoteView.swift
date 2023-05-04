//
//  CircularVoteView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 26/4/23.
//

import SwiftUI

struct CircularVoteView: View {
    let votes: Double
    
    var body: some View {
            Circle()
                .foregroundColor(Color(ThemeColor.CircularVoteBackground))
            
            Circle()
                .stroke(voteColor.opacity(0.5), lineWidth: 5)
            
            Circle()
                .trim(from: 0, to: votes == -1 ? 0 : votes / 10)
                .stroke(voteColor, style: StrokeStyle(lineWidth: 5,lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Text(votes == -1 ? "NR" : "\(votes, specifier: "%.1f")")
                .font(.caption).bold()
                .foregroundColor(.white)
                .padding()
                .frame(width: 60, height: 60)
    }
    
    var voteColor: Color {
        if votes >= 7 {
            return Color(ThemeColor.CircularVoteLineGreen)
        } else if votes >= 4 {
            return Color(ThemeColor.CircularVoteLineYellow)
        } else if votes >= 0 {
            return Color(ThemeColor.CircularVoteLineRed)
        } else {
            return Color(ThemeColor.CircularVoteLineGray)
        }
    }
}

struct CircularVoteView_Previews: PreviewProvider {
    static var previews: some View {
        CircularVoteView(votes: 7.5)
    }
}
