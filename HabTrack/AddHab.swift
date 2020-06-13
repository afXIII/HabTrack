//
//  AddHab.swift
//  HabTrack
//
//  Created by AL3 on 6/12/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct AddHab: View {
    var body: some View {
        NavigationView{
            Form{
                Text("Add habit")
            }
        .navigationBarTitle("Add new Habit")
        }
    }
}

struct AddHab_Previews: PreviewProvider {
    static var previews: some View {
        AddHab()
    }
}
