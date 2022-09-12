//
//  ContentView.swift
//  cw4
//
//  Created by khaled falah alazemi  on 12/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State var items = ["tomato", "cucumber", "potato", "pickles", "mayo"]
    // Hint : add these as a new items -> Cupcake, Kitkat, Coca
    @State var newItem = ""
    @State var random = ""
    @State var selectedItem=""
    var body: some View {
        VStack{
            List (items, id : \.self){ item in
                HStack {
                    Image(item)
                        .resizable()
                        .frame(width: 50, height: 50)
                    Text(item)
                }
                .onTapGesture {
                    selectedItem = item
                }
            }
            Text(selectedItem)
            
            HStack{
                
                Button(action: {
                    items.append(newItem)
                }) {
                    Image(systemName:"plus.app.fill")
                        .font(.title)
                        .foregroundColor(.green)
                        .padding()
                }
                
                TextField("Enter new item here", text: $newItem)

            
            
            Button(action: {
                if let index = items.firstIndex(of: selectedItem) {
                    items.remove(at: index)
                } else {
                    items.removeFirst()
                }
                
            }) {
                Image(systemName:"minus.square.fill")
                    .font(.title)
                    .foregroundColor(.red)
                   
            }
                Button(action: {
                    random = items.randomElement() ?? "nil"
                    items.append(random)
                }) {
                    Image(systemName:"questionmark.app.fill")
                        .font(.title)
                        .foregroundColor(.orange)
                        .padding()
                }
            
        
            }
            
                
            }
                   }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
