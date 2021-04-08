//
//  HabRow.swift
//  HabTrack
//
//  Created by AL3 on 6/12/20.
//  Copyright © 2020 AF3. All rights reserved.
//

import SwiftUI


struct HabRow: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) var colorScheme
    @FetchRequest(
        sortDescriptors: [],
        animation: .default)
    private var habits: FetchedResults<Habit>
    
    var habit = Habit()
    
    var body: some View {
        let habitColor = Color(red: habit.color_red, green: habit.color_green, blue: habit.color_blue, opacity: habit.color_alpha)
        VStack{
            HStack{
                if habit.type == "Goal"{
                    Image(systemName: "circles.hexagongrid.fill")
                        .foregroundColor(habitColor)
                        .font(Font.system(size: 25))
                }else if habit.type == "Infinite"{
                    Image(systemName: "infinity")
                        .foregroundColor(habitColor)
                        .font(Font.system(size: 25))
                }
                
                
                VStack(alignment: .leading){
                    Text(habit.name)
                        .font(.title)
                    Text("\(habit.type)")
                        .font(.footnote)
                }
                .padding(.leading)
                
                Spacer()
                if habit.type == "Goal"{
                    Text("\(habit.streak)/\(habit.goal)")
                        .foregroundColor(habitColor)
                }
                else if habit.type == "Infinite"{
                    Text("\(habit.streak)")
                        .foregroundColor(habitColor)
                }
                
                
            }
            if habit.type == "Goal"{
                ProgressView(value: Float(habit.streak), total: Float(habit.goal))
                    .progressViewStyle(LinearProgressViewStyle(tint: habitColor))
            }
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(colorScheme == .dark ? Color(red: 180/255, green: 180/255, blue: 180/255, opacity: 1) : Color.white).shadow(radius: 5))
        
    }
}

struct HabRow_Previews: PreviewProvider {
    static var previews: some View {
        HabRow()
    }
}
