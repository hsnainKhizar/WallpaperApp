//
//  FavouriteScreen.swift
//  WallpaperApp
//
//  Created by Husnain on 05/09/2022.
//

import SwiftUI

struct FavouriteScreen: View {
    @State var image = ""
    @State var showPreviewScreen: Bool = false
    @Binding var showFavouriteScreen:Bool
    @State var images = (UserDefaults.standard.object(forKey: "favouriteImages") as? [String])
    
    @State var data = []
    
    let adaptiveColumns = [
       GridItem(),
       GridItem(),
       GridItem()
   ]
    
    var body: some View {
//        if (images !== []) {
        ZStack{
            NavigationLink(destination: PreviewScreen(number: self.image,showPreviewScreen: self.$showPreviewScreen),isActive:self.$showPreviewScreen){
                Text("")
            }
            .hidden()
            VStack{
                if (self.images != nil){
                    
                    
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                                                   ForEach(images ?? [], id: \.self) { number in
                                                       ZStack{
                                                           Image("\(number)")
                                                               .resizable()
                                                               .scaledToFill()
                                                               .aspectRatio(contentMode: .fill)
                                                               .frame(height: 200)
                                                               .cornerRadius(10)
                                                               .onTapGesture{
                                                                   
                                                                   self.showPreviewScreen.toggle()
                                                                   self.image = number
                                   //                                            print("navigate,\(self.showPreviewScreen)")
                                                               }
                                                       }
                                                   }
                                               }
                        .padding(.all,10)
                        .animation(.interactiveSpring())
                    }
                }else{
                    VStack{
                        Text("No Wallpapers")
                            .font(.title)
                    }
                }
               
               // print(images)
            }.onAppear{
                self.images = (UserDefaults.standard.object(forKey: "favouriteImages") as? [String])
//                self.data = self.images
                print("images \(images)")
            }
         
        }
          
//        }else{
//            Text("no images")
//        }
    }
}


