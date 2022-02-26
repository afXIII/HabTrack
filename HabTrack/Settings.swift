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
    @AppStorage("cloudOn") private var cloudOn = false
    @AppStorage("notificationsOn") private var notificationsOn = false
    @AppStorage("selectedTheme") private var selectedTheme = "Light"
    
    var body: some View {
        NavigationView {
            Form{
                
                Section(header: Text("General")) {
                    HStack{
                        Text("Cloud Storage")
                        Spacer()
                        Toggle("", isOn: $cloudOn)
                            .onChange(of: cloudOn) { _ in
                                UserDefaults.standard.set(cloudOn, forKey: "cloudOn");
                            }
                    }
                    HStack{
                        Text("Notifications")
                        Spacer()
                        Toggle("", isOn: $notificationsOn)
                            .onChange(of: notificationsOn) { _ in
                                if notificationsOn == true{
                                    UNUserNotificationCenter.current().getNotificationSettings(completionHandler:{ (settings) in
                                        switch settings.authorizationStatus{
                                        case .authorized:
                                            break
                                        case .denied:
                                            notificationsOn = false;
                                        case .notDetermined:
                                            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                                                if success {
                                                    notificationsOn = true
                                                } else if let error = error {
                                                    print(error.localizedDescription)
                                                    notificationsOn = false
                                                }
                                            }
                                        default: break
                                        }
                                        UserDefaults.standard.set(notificationsOn, forKey: "notificationsOn");
                                    })
                                }else{
                                    UserDefaults.standard.set(notificationsOn, forKey: "notificationsOn");
                                }
                            }
                    }
                    
                    Picker("Theme", selection: $selectedTheme) {
                        Text("Dark").tag("Dark")
                        Text("Light").tag("Light")
                        Text("System").tag("System")
                    }
                    .onChange(of: selectedTheme) { _ in
                        UserDefaults.standard.set(selectedTheme, forKey: "selectedTheme")
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
