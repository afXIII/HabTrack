//
//  EditHab.swift
//  HabTrack
//
//  Created by AL3 on 4/6/21.
//

import SwiftUI

struct EditHab: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var habit = Habit()
    
    @State private var selectedColor =
            Color(.sRGB, red: 189/255, green: 21/255, blue: 80/255)
    var body: some View {
        VStack{
            Text("Edit Habit")
                .font(.title)
                .padding(.bottom)

            HStack{
                Text("Name")
                    .font(.title3)
                Spacer()
            }

            TextField("Habit Name", text: $habit.name)
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
            
            Picker("Please choose a type", selection: $habit.type) {
                Text("Infinite").tag("Infinite")
                Text("Goal").tag("Goal")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.bottom)
            
            if habit.type == "Goal"{
                HStack{
                    Text("Goal Amount")
                        .font(.title3)
                    Spacer()
                }
                
                Stepper("\(habit.goal)", value: $habit.goal)
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
                    habit.color_red = Double(selectedColor.components.red)
                    habit.color_green = Double(selectedColor.components.green)
                    habit.color_blue = Double(selectedColor.components.blue)
                    habit.color_alpha = Double(selectedColor.components.opacity)
                    try? viewContext.save()
                    hideKeyboard()
                    self.presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(.white)
                .font(Font.system(size: 25).bold())
            }
            Spacer()
            
        }
        .padding()
    }
}

struct EditHab_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
