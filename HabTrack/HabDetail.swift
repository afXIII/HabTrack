//
//  HabDetail.swift
//  HabTrack
//
//  Created by AL3 on 6/13/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct HabDetail: View {
    var body: some View {
        VStack {
            Text("Habit Name")
                .font(.largeTitle)
            Text("Streak: 15")
                .font(.headline)
            Spacer()
            
        }
        
    }
}

struct HabDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabDetail()
    }
}
