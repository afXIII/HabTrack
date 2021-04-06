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
    
    
    
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var habits: FetchedResults<Habit>
    
    let date: Date
    let dateFormatter: DateFormatter
    
    @ObservedObject var viewRouter: ViewRouter
    
    init(passed: ViewRouter) {
        
        date = Date()
        dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        viewRouter = passed
    }
    

    var body: some View {
    

            VStack{
                HStack{
                    Text(date, formatter: dateFormatter)
                    Spacer()
                    Image(systemName: "calendar")
                }
                .padding()
                
                NavigationView {
//                    ScrollView{
                        List{
                            
                            ForEach(habits) { habit in
                                ZStack {
                                    HabRow(habit: habit)
                                        .padding()
                                    NavigationLink(destination: HabDetail(viewRouter: viewRouter, habit: habit)){
                                            Rectangle()
                                                .fill(Color(red: 189/255, green: 21/255, blue: 80/255, opacity: 0))
                                    }
                                }
                            }
                            .onDelete(perform: { indexSet in
                                withAnimation {
                                    indexSet.map { habits[$0] }.forEach(viewContext.delete)

                                    do {
                                        try viewContext.save()
                                    } catch {
                                        // Replace this implementation with code to handle the error appropriately.
                                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                                        let nsError = error as NSError
                                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                                    }
                                }
                            })
                            EditButton()
                        }
//                    }
                    .navigationBarTitle("Habits")
                    .navigationBarHidden(true)
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 8"], id: \.self){deviceName in
            ContentView(passed: ViewRouter())
//            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        
    }
}
