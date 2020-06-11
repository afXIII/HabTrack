//
//  ContentView.swift
//  HabTrack
//
//  Created by AL3 on 6/11/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let addBtnFont = Font.system(size: 50).bold()
    @State private var showAddSheet = false
    @State private var showSettingsSheet = false
    var body: some View {
        GeometryReader { geometry in
            NavigationView{
                VStack{
                    List{
                        ForEach(0..<4){ _ in
                            Text("Task")
                        }
                    }
                    .frame(height: geometry.size.height - 200)
                    
                    Button(action: {
                        self.showAddSheet = true
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(self.addBtnFont)
                            .foregroundColor(.green)
                    }
                }
            .navigationBarTitle("HabTrack")
            .navigationBarItems(trailing:
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                    Image(systemName: "gear")
                        .foregroundColor(.black)
                }
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
