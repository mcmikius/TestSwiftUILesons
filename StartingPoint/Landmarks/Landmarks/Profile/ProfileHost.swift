//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Mykhailo Bondarenko on 03.09.2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileHost: View {
    @State var profile = Profile.default
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            ProfileSummary(profile: self.profile)
        }
        .padding()
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
    }
}
