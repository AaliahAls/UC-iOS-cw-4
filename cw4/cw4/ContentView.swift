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
   // @State var random = ""
    @State var selectedItem=""
   // @State var msg=""
    
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
            } .font(.title2)
              .foregroundColor(.black)
            
                
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
                if items.isEmpty == false {
                if let index = items.firstIndex(of: selectedItem) {
                    items.remove(at: index)
                } else {
                    items.removeFirst()
                }
                }
            
            }) {
                if items.isEmpty == false {
                Image(systemName:"minus.square.fill")
                    .font(.title)
                    .foregroundColor(.red)
                } else if items.isEmpty {
                    Image(systemName:"minus.square.fill")
                        .font(.title)
                        .foregroundColor(.gray)
                    disabled(true)
                }
                   
            }
                Button(action: {
                    //random = items.randomElement() ?? "nil"
                    items.append((items.randomElement() ?? "nil"))
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
