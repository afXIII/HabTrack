//
//  MainTabView.swift
//  HabTrack
//
//  Created by AL3 on 4/2/21.
//

import SwiftUI
import UserNotifications

struct MainTabView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack{
            switch viewRouter.currentPage {
            case .habits:
                ContentView(passed: viewRouter)
            case .settings:
                Settings()
            case .addhabit:
                AddHab(viewRouter: viewRouter)
            }
            
            ZStack {
                VStack(spacing: 0) {
                    Rectangle()
                        .fill(colorScheme == .dark ? Color.black : Color.white)
                        .frame(height:25)
                    ZStack{
                        Rectangle()
                            .fill(colorScheme == .dark ? Color(red: 100/255, green: 100/255, blue: 100/255, opacity: 1) : Color(red: 220/255, green: 220/255, blue: 220/255, opacity: 1))
                            .frame(height:60)
                            .shadow(radius: 5)
                        HStack{
                            Spacer()
                            Image(systemName: "house")
                                .onTapGesture {
                                    viewRouter.currentPage = .habits
                                }
                                .font(Font.system(size: 20))
                            Spacer()
                            Spacer()
                            Spacer()
                            Image(systemName: "gear")
                                .onTapGesture {
                                    viewRouter.currentPage = .settings
                                }
                                .font(Font.system(size: 20))
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
                .offset(y:-15)
                .onTapGesture {
                    viewRouter.currentPage = .addhabit
                }
                
            }
        }
        .onAppear{
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                if success {
                    print("All set!")
                } else if let error = error {
                    print(error.localizedDescription)
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
