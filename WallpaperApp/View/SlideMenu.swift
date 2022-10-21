//
//  SlideMenu.swift
//  WallpaperApp
//
//  Created by Husnain on 12/09/2022.
//

import SwiftUI

struct SlideMenu: View {
    @State var showFavouriteScreen = false
    //    @State var x = -UIScreen.main.bounds.width + 90
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        
        
        ZStack{
            NavigationLink(destination: FavouriteScreen(showFavouriteScreen: self.$showFavouriteScreen),isActive:self.$showFavouriteScreen){
                Text("")
            }
            .hidden()
            
            HStack(spacing: 0){
                
                VStack(alignment: .leading){
                    
                    HStack{
                        Spacer()
                        VStack{
                            Image("vip")
                                .resizable()
                                .frame(width:50,height:50)
                            Text("VIP ACCESS")
                                .padding(.top)
                            
                            Text("Unlimited Content-Daily Updates-Ad-Free")
                                .foregroundColor(.gray)
                                .font(.caption)
                                .padding(.vertical)
                        }
                        Spacer()
                    }
                    
                    VStack (alignment: .leading){
                        Button {
                            self.showFavouriteScreen.toggle();
                        } label: {
                            Label("Favourite Wallpapers", systemImage: "star.fill")
                        }
                        .foregroundColor(.black)
                        .padding(.top)
                        
                        Divider().frame(width: 200)
                        
                        Button {
                            print("Edit button was tapped")
                        } label: {
                            Label("Privacy Policy", systemImage: "square.and.pencil")
                        }
                        .foregroundColor(.black)
                        Divider()
                        
                        Button {
                            print("Edit button was tapped")
                        } label: {
                            Label("Terms of use", systemImage: "square.and.pencil")
                        }
                        .foregroundColor(.black)
                        Divider()
                        
                        Button {
                            print("Edit button was tapped")
                        } label: {
                            Label("Rate us", systemImage: "arrowshape.turn.up.backward.fill")
                        }
                        .foregroundColor(.black)
                        Divider()
                        
//                        Button {
//                            print("Edit button was tapped")
//                        } label: {
//                            Label("Create Wallpaper", systemImage: "paintbrush.pointed.fill")
//                        }
//                        .foregroundColor(.black)
//                        Divider()
                    }
                    
                    Spacer(minLength: 0)
                    
                }
                .padding(.horizontal,20)
                .padding(.top,edges!.top == 0 ? 15 : edges?.top)
                .padding(.bottom,edges!.bottom == 0 ? 15 : edges?.bottom)
                .frame(width: UIScreen.main.bounds.width - 90)
                .background(Color.white)
                .ignoresSafeArea(.all, edges: .vertical)
                
                Spacer(minLength: 0)
            }
        }
        
        
    }
}

//struct SlideMenu_Previews: PreviewProvider {
//    static var previews: some View {
//        SlideMenu()
//    }
//}
