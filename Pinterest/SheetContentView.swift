//
//  SheetContentView.swift
//  Pinterest
//
//  Created by Vincenza Loreto on 16/11/23.
//

import SwiftUI

struct SheetContentView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let imageNames = ["Contatti", "Whatsapp", "Instagram", "Imessage", "Link", "Dots"]
    
    let imageSizes: [CGSize] = [
        CGSize(width: 30, height: 30),
        CGSize(width: 55, height: 55),
        CGSize(width: 62, height: 55),
        CGSize(width: 55, height: 55),
        CGSize(width: 45, height: 45),
        CGSize(width: 50, height: 45)
    ]

    var captions = [
        "Contacts",
        "Whatsapp",
        "Instagram",
        "Messages",
        "Copia Link",
        "More apps",
    ]
    

    var body: some View {
        ZStack {
            Color("BackColor")
                .ignoresSafeArea()
            VStack {
                VStack {
                    Text("Share")
                        .bold()
                        .font(.system(size: 20))
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(0..<imageNames.count, id: \.self) { index in
                                VStack {
                                    ZStack {
                                        Circle()
                                            .frame(width: 55, height: 55)
                                            .foregroundColor(Color(white: 0.3))
                                        
                                        Image(imageNames[index])
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: imageSizes[index].width, height: imageSizes[index].height)
                                            .clipShape(Circle())
                                           
                                    }
                                    Text(captions[index])
                                        .font(.system(size: 15))
                                }
                            }
                        }
                        .padding()
                    }
                    Divider()
                        .frame(height: 2)
                                                .background(Color.white.opacity(0.8))
                   
                    VStack(alignment: .leading, spacing: 20) {
                        Text("""
        This Pin was inspired by your recent activity
        """)
                        .lineLimit(nil)
                            .font(.system(size: 15))
                            .fontWeight(.semibold)
                        Text("Hide")
                            .font(.system(size: 20))
                            .bold()
                        Text("Report")
                            .font(.system(size: 20))
                            .bold()
                    }
                    .padding(.top, 10)
                    Spacer()
                    
                    Button(action: {
                       
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        ZStack {
                            Rectangle()
                                .frame(width: 100, height: 60)
                                .cornerRadius(50)
                                .foregroundColor(Color("ButtonColor"))
                            Text("Close")
                                .bold()
                                .font(.system(size: 20))
                                .foregroundColor(.primary)
                                .padding()
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct SheetContentView_Previews: PreviewProvider {
    static var previews: some View {
        SheetContentView()
    }
}
