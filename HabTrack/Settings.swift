//
//  Settings.swift
//  HabTrack
//
//  Created by AL3 on 6/12/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI
import UserNotifications

struct Settings: View {
    @State private var cloudOn = false
    @State private var notificationsOn = false
    @State private var selectedTheme = "Light"
    
    var body: some View {
        NavigationView {
            Form{
                
                Section(header: Text("General")) {
                    HStack{
                        Text("Cloud Storage")
                        Spacer()
                        Toggle("", isOn: $cloudOn)
                    }
                    HStack{
                        Text("Notifications")
                        Spacer()
                        Toggle("", isOn: $notificationsOn)
                            .onTapGesture {
                                if notificationsOn == false{
                                    UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                        if success {
                                            print("All set!")
                                        } else if let error = error {
                                            print(error.localizedDescription)
                                        }
                                    }
                                }else{
                                    
                                }
                            }
                    }
                    
                    Picker("Theme", selection: $selectedTheme) {
                        Text("Dark").tag("Dark")
                        Text("Light").tag("Light")
                        Text("System").tag("System")
                    }
                }

                
                Section(header: Text("App info")) {
                    HStack{
                        Text("About HabTrack")
                        Spacer()
                        
                    }
                    HStack{
                        Text("Contact Us")
                        Spacer()
                        
                    }
                    
                }
                
                
            }

            .navigationBarTitle("Settings", displayMode: .inline)
//            .navigationBarHidden(true)
        }
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
