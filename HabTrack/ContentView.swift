//
//  ContentView.swift
//  HabTrack
//
//  Created by AL3 on 3/31/21.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI
import CoreData



struct ContentView: View {
    
    let date: Date
    let dateFormatter: DateFormatter
    
    init() {
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
    }
    
    var tasks = [String]()

    var body: some View {
    

            VStack{
                HStack{
                    Text(date, formatter: dateFormatter)
                    Spacer()
                    Image(systemName: "calendar")
                }
                .padding()
                
                NavigationView {
                    ScrollView{
                        LazyVStack{
                            ForEach(0..<3){ _ in
                                ZStack {
                                    HabRow()
                                        .padding()
                                    NavigationLink(destination: HabDetail()){
                                            Rectangle()
                                                .fill(Color(red: 189/255, green: 21/255, blue: 80/255, opacity: 0))
                                    }
                                }
                            }
                        }
                    }
                    .navigationBarTitle("Habits")
                    .navigationBarHidden(true)
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8"], id: \.self){deviceName in
            ContentView()
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
