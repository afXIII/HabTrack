//
//  HabRow.swift
//  HabTrack
//
//  Created by AL3 on 6/12/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct HabRow: View {
    var body: some View {
        HStack{
            Text("Habit Name")
                .font(.title)
            Spacer()
            Text("15")
                .foregroundColor(Color(.red))
            
        }
    }
}

struct HabRow_Previews: PreviewProvider {
    static var previews: some View {
        HabRow()
    }
}
