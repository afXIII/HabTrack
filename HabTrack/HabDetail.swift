//
//  HabDetail.swift
//  HabTrack
//
//  Created by AL3 on 6/13/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct HabDetail: View {
    
    
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewRouter: ViewRouter
    
    var habit = Habit()
    @State private var showEditSheet = false
    
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.largeTitle)
            Text("Streak: \(habit.streak)")
                .font(.headline)
            Button("Done"){
                habit.streak += 1
                try? viewContext.save()
                self.presentationMode.wrappedValue.dismiss()
            }
            
                       
            Button("Edit"){
                showEditSheet = true
            }
            
            Button("Delete"){
                viewContext.delete(habit)
                try? viewContext.save()
                self.presentationMode.wrappedValue.dismiss()
            }

            Spacer()
            
        }
        .sheet(isPresented: $showEditSheet) {
            EditHab(habit: habit)
        }
        
    }
}

struct HabDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabDetail(viewRouter: ViewRouter())
    }
}
