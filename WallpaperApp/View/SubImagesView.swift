//
//  SubImagesView.swift
//  WallpaperApp
//
//  Created by Husnain on 12/09/2022.
//

import SwiftUI

struct SubImagesView:View{
    
    @State var image = ""
    @State var showPreviewScreen: Bool = false
    
    @State var folder:String
    var data = ["subWall1","subWall2","subWall3","subWall4","subWall5","subWall6",
                "subWall7","subWall8","subWall9","subWall10","subWall11","subWall12",
                "subWall13","subWall14","subWall15","subWall16","subWall17","subWall18",
                "subWall19","subWall20"
    ]
    
    var data2 = ["subWall21","subWall22","subWall23","subWall24","subWall25","subWall26",
                 "subWall27","subWall28","subWall29","subWall30","subWall31","subWall32",
                 "subWall33","subWall34","subWall35","subWall36","subWall37","subWall38",
                 "subWall39","subWall40"
    ]
    
    var data3 = ["subWall41","subWall42","subWall43","subWall44","subWall45","subWall46",
                 "subWall47","subWall48","subWall49","subWall50","subWall51","subWall52",
                 "subWall53","subWall54","subWall55","subWall56","subWall57","subWall58",
                 "subWall59","subWall60"
    ]
    
    var data4 = ["subWall61","subWall62","subWall63","subWall64","subWall65","subWall66",
                 "subWall67","subWall68","subWall69","subWall70","subWall71","subWall72",
                 "subWall73","subWall74","subWall75","subWall76","subWall77","subWall78",
                 "subWall79","subWall80"
    ]
    
    var data5 = ["subWall81","subWall82","subWall83","subWall84","subWall85","subWall86",
                 "subWall87","subWall88","subWall89","subWall90","subWall91","subWall92",
                 "subWall93","subWall94","subWall95","subWall96","subWall97","subWall98",
                 "subWall99","subWall100"
    ]
    
    var data6 = ["subWall101","subWall102","subWall103","subWall104","subWall105","subWall106",
                 "subWall107","subWall108","subWall109","subWall110","subWall111","subWall112",
                 "subWall113","subWall114","subWall115","subWall116","subWall117","subWall118",
                 "subWall119","subWall120"
    ]
    
    let adaptiveColumns = [
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    var body:some View {
        ZStack{
            NavigationLink(destination: PreviewScreen(number: self.image,showPreviewScreen: self.$showPreviewScreen),isActive:self.$showPreviewScreen){
                Text("")
            }
            .hidden()
            VStack{
                if self.folder == "wall1" {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(data, id: \.self) { number in
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
                    
                }
                
                if self.folder == "wall2" {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(data2, id: \.self) { number in
                                ZStack{
                                    Image("\(number)")
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                    //                                    .foregroundColor(Color.red)
                                        .cornerRadius(10)
                                        .onTapGesture{
                                            
                                            self.showPreviewScreen.toggle()
                                            self.image = number
                                            //                                            print("navigate,\(self.showPreviewScreen)")
                                        }
                                }
                                
                            }
                        }//LazyVGrid
                        .padding(.all,10)
                        .animation(.interactiveSpring())
                        
                    }
                    
                }
                
                if self.folder == "wall3" {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(data3, id: \.self) { number in
                                ZStack{
                                    Image("\(number)")
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                    //                                    .foregroundColor(Color.red)
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
                    
                }
                
                if self.folder == "wall4" {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(data4, id: \.self) { number in
                                ZStack{
                                    Image("\(number)")
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                    //                                    .foregroundColor(Color.red)
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
                    
                }
                
                if self.folder == "wall5" {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(data5, id: \.self) { number in
                                ZStack{
                                    Image("\(number)")
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                    //                                    .foregroundColor(Color.red)
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
                    
                }
                
                if self.folder == "wall6" {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                            ForEach(data6, id: \.self) { number in
                                ZStack{
                                    Image("\(number)")
                                        .resizable()
                                        .scaledToFill()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 200)
                                    //                                    .foregroundColor(Color.red)
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
                    
                }
            }
            //            .frame(width: UIScreen.main.bounds.width - 20)
        }
        
    }
}
//struct SubImagesView_Previews: PreviewProvider {
//    static var previews: some View {
//        SubImagesView()
//    }
//}
