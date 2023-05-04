//
//  CastGridCellView.swift
//  FilmFinder
//
//  Created by Laura Riera Rayo on 27/4/23.
//

import SwiftUI

struct CastGridCellView: View {
    let member: Cast
    
    var body: some View {
        VStack {
            AsyncImageView(imageType: .profile, imagePath: member.iProfilePath)
                .frame(width: 150)
            VStack(alignment: .leading) {
                Text(member.iName).bold()
                Text(member.iCharacter)
            }
            .foregroundColor(.primary)
            .padding()
            .frame(width: 150, height: 150, alignment: .topLeading)
        }
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .secondary, radius: 5)
        //.frame(width: 200, height: 300)
    }
}

struct CastGridCellView_Previews: PreviewProvider {
    static var previews: some View {
        CastGridCellView(member: Cast(adult: nil, gender: nil, id: 640146, knownForDepartment: nil, name: "Michelle Pfeiffer Pfeiffer", originalName: "Michelle Pfeiffer", popularity: nil, profilePath: "/8eTtJ7XVXY0BnEeUaSiTAraTIXd.jpg", castID: 1, character: "Janet van Dyne Pfeiffer", creditID: "", order: nil, department: nil, job: nil))
            .frame(height: 400)
    }
}
