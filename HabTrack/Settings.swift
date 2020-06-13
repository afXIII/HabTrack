//
//  Settings.swift
//  HabTrack
//
//  Created by AL3 on 6/12/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView{
            Form{
                Text("Settings")
            }
        .navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
