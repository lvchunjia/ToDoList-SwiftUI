//
//  NoItemsView.swift
//  ToDoList
//
//  Created by 中律十七 on 2024/5/10.
//

import SwiftUI

struct NoItemsView: View {
    @State private var animated: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                Text("No Items").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Please add items")
                
                NavigationLink(destination: AddView(), label: {
                    Text("Add Here")
                        .foregroundStyle(.white)
                        .frame(height: 45)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(animated ? Color.accentColor : Color.red)
                        .cornerRadius(10)
                })
                .padding(.horizontal, animated ? 50 : 30)
            }
            .padding(40)
            .onAppear(perform: animation)
        }
    }
    
    func animation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            withAnimation(Animation.easeInOut(duration: 1).repeatForever()) {
                animated.toggle()
            }
        })
        
    }
}

#Preview {
    NoItemsView()
}
