//
//  ContentView.swift
//  IOS_UI
//
//  Created by 北川 on 2025/2/9.
//

import SwiftUI
import CoreData

struct ContentView: View {

    @State var inputString: String = ""
    
    var body: some View {
        // 网络请求图片
        AsyncImage(url: URL(string: "")) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 50)
                .cornerRadius(16)
        } placeholder: {
            Text("Loading")
                .font(.title)
                .foregroundColor(.black)
                .padding()
                .frame(width: /*@START_MENU_TOKEN@*/55.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/55.0/*@END_MENU_TOKEN@*/)
                .background(Color(.systemGray))
        }
        VStack(alignment: .leading) {
            TextField("请输入", text: $inputString)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Text("Title")
                .font(.title)
            HStack {
                Text(/*@START_MENU_TOKEN@*/"Park"/*@END_MENU_TOKEN@*/)
                    .font(.subheadline)
                Spacer()
                Text("pardk1")
                    .font(.subheadline)
            }
        }
        .padding()
        .onTapGesture {
            hidekeyboard()
        }
        
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
