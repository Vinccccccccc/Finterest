//
//  PinterestView.swift
//  Pinterest
//
//  Created by Vincenza Loreto on 14/11/23.
//

import SwiftUI


struct PinterestStyleLayout: View {
    
    @State private var showHalfSheet = false
    
    let imageData = [
        ("Theweeknd", "Goat", CGFloat.random(in: 250...470)),
        ("Tlou", "", CGFloat.random(in: 250...470)),
        ("Starwars", "SW", CGFloat.random(in: 250...470)),
        ("Scream", "", CGFloat.random(in: 250...470)),
        ("Iphone", "Apple", CGFloat.random(in: 250...470)),
        ("Grogu", "Grogu", CGFloat.random(in: 250...470)),
        ("Cat", "", CGFloat.random(in: 250...470)),
        ("Nike", "Nike logo", CGFloat.random(in: 250...470))
    ]

    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ZStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 0.001) {
                    ForEach(Array(zip(imageData.indices, imageData)), id: \.0) { index, imageInfo in
                        VStack {
                            GeometryReader { geometry in
                                Image(imageInfo.0)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: imageInfo.2)
                                    .clipped()
                            }
                            .cornerRadius(25)
                            .shadow(radius: 10)
                            .padding(index % 2 == 0 ? .leading : .trailing, 15)

                            HStack {
                                Text(imageInfo.1)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .frame(alignment: .leading)

                                Spacer()
                                Button{
                                    showHalfSheet.toggle()
                                } label: {
                                    Image(systemName: "ellipsis")
                                        .font(.system(size: 17))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color(.label))
                                }
                                
                               
                            }
                            .sheet(isPresented: $showHalfSheet)
                            {
                                SheetContentView()
                                    .presentationDetents([.height(415)])
                            }
                            
                            .padding([.horizontal, .bottom])
                        }
                        .frame(height: imageInfo.2 + 40)
                    }
                }
            }


        }
    }
}


struct PinterestMainContent: View {
    var body: some View {
        // Schermata principale
        // Aggiungi qui il contenuto della schermata principale
        Text("Contenuto principale")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PinterestStyleLayout()
    }
}
