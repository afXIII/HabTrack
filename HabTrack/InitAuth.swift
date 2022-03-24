//
//  InitAuth.swift
//  HabTrack
//
//  Created by AL3 on 3/24/22.
//

import SwiftUI
import LocalAuthentication

struct InitAuth: View {
    
    @State private var isUsingBiometrics = UserDefaults.standard.bool(forKey: "useBiometrics")
    @State private var isAuthenticated = false
    let persistenceController = PersistenceController.shared
    @StateObject var viewRouter = ViewRouter()

    
    var body: some View {
        VStack{
            if (isAuthenticated || !isUsingBiometrics){
                MainTabView(viewRouter: viewRouter)
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
            }
        }
        .onAppear(perform: authenticateBiometrics)
    }
    
    func authenticateBiometrics(){
        if isUsingBiometrics{
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
                let reason = "To only show habit data if authenticated"
                
                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                    success, authenticationError in
                    if success {
                        isAuthenticated = true
                    } else {
                        // authentication fail
                    }
                }
                
            } else {
                //TODO: Add alert that says device not supported
            }
        }
        
    }
}

struct InitAuth_Previews: PreviewProvider {
    static var previews: some View {
        InitAuth()
    }
}
