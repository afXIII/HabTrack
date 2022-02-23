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
    @State private var habitColorsFormula = 0.0;
    @State private var isHabitColorDark = false;
    var body: some View {
        VStack {
            Text(habit.name)
                .font(.largeTitle)
            Text("Streak: \(habit.streak)")
                .font(.headline)
            
            Spacer()

            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(.sRGB, red: habit.color_red, green: habit.color_green, blue: habit.color_blue, opacity: habit.color_alpha))
                    .frame(width:100, height: 50)
                    .shadow(radius: 10)
                Button("Done"){
                    habit.streak += 1
                    try? viewContext.save()
                    self.presentationMode.wrappedValue.dismiss()
                }
                .foregroundColor(isHabitColorDark ? Color.black : Color.white)
                .font(Font.system(size: 25).bold())
            }.padding(.bottom)

            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.sRGB, red: habit.color_red, green: habit.color_green, blue: habit.color_blue, opacity: habit.color_alpha))
                        .frame(width:100, height: 50)
                        .shadow(radius: 10)
                    Button("Edit"){
                        showEditSheet = true
                    }
                    .foregroundColor(isHabitColorDark ? Color.black : Color.white)
                    .font(Font.system(size: 25).bold())
                }.padding(.trailing)
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color(.sRGB, red: 189/255, green: 21/255, blue: 80/255))
                        .frame(width:100, height: 50)
                        .shadow(radius: 10)
                    Button("Delete"){
                        viewContext.delete(habit)
                        try? viewContext.save()
                        self.presentationMode.wrappedValue.dismiss()
                    }
                    .font(Font.system(size: 25).bold())
                }
            }

            Spacer()
            
        }
        .sheet(isPresented: $showEditSheet) {
            EditHab(habit: habit)
        }
        .onAppear{
            habitColorsFormula = habit.color_red*0.299 + habit.color_green*0.587 + habit.color_blue*0.114;
            isHabitColorDark = (habitColorsFormula * 255) > 186
        }
    }
        
}

struct HabDetail_Previews: PreviewProvider {
    static var previews: some View {
        HabDetail(viewRouter: ViewRouter())
    }
}
