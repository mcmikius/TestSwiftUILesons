//
//  ProfileEditor.swift
//  Landmarks
//
//  Created by Mykhailo Bondarenko on 03.09.2019.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate)!
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate)!
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text(string: "Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text(string: "Enable Notifications")
            }
            
            VStack(alignment: .leading, spacing: 20) {
//                Text("Seasonal Photo").bold()
                Picker({ Text("Seasonal Photo").bold() }, selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases.identified(by: \.self)) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                    
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.top)
            
            VStack(alignment: .leading, spacing: 20) {
                DatePicker(
                    selection: $profile.goalDate,
                    in: dateRange,
                    displayedComponents: .date,
                    label: { Text("Due Date").bold() }
                )
            }
            .padding(.top)
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
