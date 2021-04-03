//
//  AddHab.swift
//  HabTrack
//
//  Created by AL3 on 6/12/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI

struct AddHab: View {
    
    enum HabitType: String, CaseIterable, Identifiable {
        case Infinite
        case Goal

        var id: String { self.rawValue }
    }
    
    enum ColorType: String, CaseIterable, Identifiable {
        case Infinite
        case Goal

        var id: String { self.rawValue }
    }
    
    @State private var habitName = ""
    @State private var selectedType = HabitType.Infinite
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
                Text("Infinite").tag(HabitType.Infinite)
                Text("Goal").tag(HabitType.Goal)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom)
            
            if self.selectedType == HabitType.Goal{
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
                Text("Save")
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
        AddHab()
    }
}
