//
//  ContentView.swift
//  HabTrack
//
//  Created by AL3 on 6/11/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let addBtnFont = Font.system(size: 30).bold()
    var tasks = [String]()
    @State private var showSheet = false
    @State private var sheetView = ""
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(0..<14){ _ in
                        NavigationLink(destination: HabDetail()){
                            HabRow()
                        }
                    }
                    .onDelete { (IndexSet) in
                    }
                }
                ZStack {
                    VStack(spacing: 0) {
                        Rectangle()
                            .fill(Color.white)
                            .frame(height:50)
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height:50)
                            .overlay(Rectangle().stroke(Color.black, lineWidth: 3))
                            .shadow(radius: 10)
                    }
                    Button(action: {
                        self.sheetView = "addHab"
                        self.showSheet = true
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.green)
                                .frame(width:60, height: 100)
                                .shadow(radius: 10)
                            Image(systemName: "plus")
                                .foregroundColor(.white)
                                .font(addBtnFont)
                        }
                    }
                }
            }
            .navigationBarTitle("HabTrack")
            .navigationBarItems(trailing:
                Button(action: {
                    self.sheetView = "settings"
                    self.showSheet = true
                }) {
                    Image(systemName: "gear")
                        .foregroundColor(.black)
                        .font(Font.system(size: 25).bold())
            })
            .sheet(isPresented: self.$showSheet){
                if self.sheetView == "addHab"{
                    AddHab()
                } else {
                    Settings()
                }
            }
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .padding(1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        , "iPhone 11 Pro", "iPad Pro (9.7-inch)"
//        Group {
            ForEach(["iPhone 8"], id: \.self){deviceName in
                ContentView()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
            }
//            ForEach(["iPad Pro (9.7-inch)"], id: \.self){deviceName in
//                ContentView()
//                    .previewDevice(PreviewDevice(rawValue: deviceName))
//                    .previewDisplayName(deviceName)
//            }
//        }
        
    }
}
