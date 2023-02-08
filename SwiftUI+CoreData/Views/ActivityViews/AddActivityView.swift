//
//  AddActivityView.swift
//  SwiftUI+CoreData
//
//  Created by Igor Polousov on 06.02.2023.
//

import SwiftUI

struct AddActivityView: View {
    
    @State private var taskDescription: String = ""
    @State private var additionalDescription: String = ""
    
    @State private var selectedDate: String = Date().dateFormatter()
    @State private var pickerMockData = [Date().dateFormatter(), Date().add(days: 1).dateFormatter(), Date().add(days: 2).dateFormatter(), Date().add(days: 3).dateFormatter()]
    
    var body: some View {
        
        ZStack {
            Color.gray
                .opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(Theme.backgroundColor!))
                .modifier(AddViewsModifier(height: 330, bottomPadding: 200))
            
            VStack {
                
                Text("Add Activity")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .frame(height: 40)
                    .padding(.leading, 30)
                    .font(Font(Theme.mainFont!))
                
                
                Picker("Choose date", selection: $selectedDate) {
                    ForEach(pickerMockData, id: \.self) { date in
                        Text("\(date)")
                    }
                }
                .frame(width: 330, height: 40)
                .font(Font(Theme.dayFont!))
                .tint(Color(Theme.tintColor!))
                
                
                HStack {
                    Image("hotel")
                    Image("taxi")
                    Image("train")
                    Image("food")
                    Image("flight")
                }
                
                TextField("  Add Activity Description", text: $taskDescription)
                    .modifier(TextFieldModifier())
                
                TextField("  Add additional description (Optional)", text: $additionalDescription)
                    .modifier(TextFieldModifier())
                
                HStack {
                    Button("Cancel") {
                        // here wil be Cancel action
                    }
                    .modifier(PopUpButton( cornerRadius: 10))
                    
                    Spacer()
                    
                    Button("Save") {
                        // Here will be save action
                    }
                    .modifier(PopUpButton(cornerRadius: 10))
                }
                .frame(width: 360)
            }
            .padding(.bottom, 190)
            
         
            
        }
    }
}

struct AddActivityView_Preview: PreviewProvider {
    static var previews: some View {
        AddActivityView()
    }
}




