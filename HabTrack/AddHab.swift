//
//  AddHab.swift
//  HabTrack
//
//  Created by AL3 on 6/12/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct AddHab: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var viewRouter: ViewRouter
    
    
    @State private var habitName = ""
    @State private var selectedType = "Infinite"
    @State private var habGoal = ""
    @State private var selectedColor =
            Color(.sRGB, red: 189/255, green: 21/255, blue: 80/255)
    
    var body: some View {
        VStack{
            Text("New Habit")
                .font(.title)
                .padding(.bottom)

            HStack{
                Text("Name")
                    .font(.title3)
                Spacer()
            }

            TextField("Habit Name", text: $habitName)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 230/255, green: 230/255, blue: 230/255, opacity: 1)).shadow(radius: 5))
                .foregroundColor(.black)
                .padding(.bottom)
            
            HStack{
                Text("Type")
                    .font(.title3)
                Spacer()
            }
            
            Picker("Please choose a type", selection: $selectedType) {
                Text("Infinite").tag("Infinite")
                Text("Goal").tag("Goal")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom)
            
            if self.selectedType == "Goal"{
                HStack{
                    Text("Goal Amount")
                        .font(.title3)
                    Spacer()
                }

                TextField("Habit Goal Amount", text: $habGoal)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 230/255, green: 230/255, blue: 230/255, opacity: 1)).shadow(radius: 5))
                    .foregroundColor(.black)
                    .padding(.bottom)
            }
            
            HStack{
                Text("Color")
                    .font(.title3)
                Spacer()
            }
            ColorPicker("Habit Color:", selection: $selectedColor)
            .padding(.bottom)
            
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.green)
                    .frame(width:100, height: 50)
                    .shadow(radius: 10)
                Button("Save") {
                    let newHabit = Habit(context: viewContext)
                    newHabit.name = habitName
                    newHabit.type = selectedType
                    newHabit.goal = Int16(habGoal) ?? 0
                    newHabit.streak = 0
                    newHabit.color_red = Double(selectedColor.components.red)
                    newHabit.color_green = Double(selectedColor.components.green)
                    newHabit.color_blue = Double(selectedColor.components.blue)
                    newHabit.color_alpha = Double(selectedColor.components.opacity)
                    do {
                        try viewContext.save()
                    } catch {
                        // Replace this implementation with code to handle the error appropriately.
                        // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                        let nsError = error as NSError
                        fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                    }
                    habitName = ""
                    hideKeyboard()
                    viewRouter.currentPage = .habits
                }
                .foregroundColor(.white)
                .font(Font.system(size: 25).bold())
            }
            Spacer()
            
        }
        .padding()
    }
}

struct AddHab_Previews: PreviewProvider {
    static var previews: some View {
        AddHab(viewRouter: ViewRouter())
    }
}
