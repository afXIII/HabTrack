//
//  MainTabView.swift
//  HabTrack
//
//  Created by AL3 on 4/2/21.
//

import SwiftUI

struct MainTabView: View {
    
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            switch viewRouter.currentPage {
            case .habits:
                ContentView()
            case .settings:
                Settings()
            case .addhabit:
                AddHab()
            }
            
            ZStack {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.white)
                        .frame(height:25)
                    ZStack{
                        Rectangle()
                            .fill(Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1))
                            .frame(height:50)
                            .shadow(radius: 5)
                        HStack{
                            Spacer()
                            Image(systemName: "house")
                                .onTapGesture {
                                    viewRouter.currentPage = .habits
                                }
                            Spacer()
                            Spacer()
                            Spacer()
                            Image(systemName: "gear")
                                .onTapGesture {
                                    viewRouter.currentPage = .settings
                                }
                            Spacer()
                        }
                    }
                    
                }

                ZStack {
                    Circle()
                        .fill(Color.green)
                        .frame(width:60, height: 75)
                        .shadow(radius: 10)
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                            .font(Font.system(size: 30).bold())
                }
                .offset(y:-5)
                .onTapGesture {
                    viewRouter.currentPage = .addhabit
                }
                
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(viewRouter: ViewRouter())
//            .preferredColorScheme(.dark)
    }
}
