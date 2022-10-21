//
//  WallView.swift
//  WallpaperApp
//
//  Created by Husnain on 12/09/2022.
//

import SwiftUI

struct WallView: View{
    
    @State var image = ""
    @Binding var x : CGFloat
    
    @State var showCreateWallpaperScreen = false
    
    @Binding var showPreviewScreen: Bool
    var data = ["wall1","wall2","wall3","wall4","wall5","wall6"
    ]
    
    let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        ZStack{
            NavigationLink(destination: SubImagesView(folder: self.image),isActive:self.$showPreviewScreen){
                Text("")
            }
            .hidden()
            
            NavigationLink(destination: CreateWallpaperScreen(),isActive:self.$showCreateWallpaperScreen){
                Text("")
                
            }
            .hidden()
            VStack{
                
                HStack{
                    Button(action: {
                        withAnimation{
                            x = 0
                        }
                        
                    }){
                        Image(systemName: "ellipsis")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text("4K Wallpapers for Fortnite")
                    Spacer()
                    Button(action: {
                        self.showCreateWallpaperScreen.toggle()
                    }){
                        Image(systemName: "square.and.pencil")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    //                    Image(systemName: "square.and.pencil")
                }
                .padding(.horizontal)
                .padding(.bottom,13)
                ScrollView(showsIndicators: false) {
                    LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                        ForEach(data, id: \.self) { number in
                            ZStack{
                                Image("\(number)")
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 170, height: 170)
                                //                                    .foregroundColor(Color.red)
                                    .cornerRadius(10)
                                    .onTapGesture{
                                        
                                        self.showPreviewScreen.toggle()
                                        self.image = number
                                        print("navigate,\(self.showPreviewScreen)")
                                    }
                            }
                        }
                    }
                    .padding(.all,10)
                    .animation(.interactiveSpring())
                }
            }
        }
        
        .navigationBarHidden(true)
    }
}

//struct WallView_Previews: PreviewProvider {
//    static var previews: some View {
//        WallView()
//    }
//}
