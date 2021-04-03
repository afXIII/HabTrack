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
        VStack{
            HStack{
                Image(systemName: "circles.hexagongrid.fill")
                    .foregroundColor(Color(red: 189/255, green: 21/255, blue: 80/255, opacity: 1))
                    .font(Font.system(size: 25))
                
                VStack(alignment: .leading){
                    Text("Habit Name")
                        .font(.title)
                    Text("Habit details")
                        .font(.footnote)
                }
                .padding(.leading)
                
                Spacer()
                Text("15")
                    .foregroundColor(Color(red: 189/255, green: 21/255, blue: 80/255, opacity: 1))
                
            }
            ProgressView(value: 50, total: 100)
                .progressViewStyle(LinearProgressViewStyle(tint: Color(red: 189/255, green: 21/255, blue: 80/255, opacity: 1)))
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color.white).shadow(radius: 5))
        
    }
}

struct HabRow_Previews: PreviewProvider {
    static var previews: some View {
        HabRow()
    }
}
