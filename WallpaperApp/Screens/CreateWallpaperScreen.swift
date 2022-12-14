//
//  CreateWallpaperScreen.swift
//  WallpaperApp
//
//  Created by Husnain on 08/09/2022.
//

import SwiftUI

struct CreateWallpaperScreen : View {
    
  
    @StateObject var homeData = HomeViewModel()
    var body: some View {
        VStack{
            
            if !homeData.allImages.isEmpty && homeData.mainView != nil{
                
                Spacer(minLength: 0)
                Image(uiImage: homeData.mainView.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:UIScreen.main.bounds.width)
                
                
                Slider(value: $homeData.value)
                    .padding()
                    .opacity(homeData.mainView.isEditable ? 1 : 0)
                    .disabled(homeData.mainView.isEditable ? false : true)
                
                ScrollView(.horizontal, showsIndicators: false){
                    
                    HStack(spacing: 20){
                        ForEach(homeData.allImages){filtered in
                            
                            Image(uiImage: filtered.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width:150,height:150)
                                .onTapGesture {
                                    homeData.value = 1.0
                                    homeData.mainView = filtered
                                }
                        }
                    }//hstack
                    .padding()
                    
                   
                }
            }
            
            else if homeData.imageData.count == 0 {
                Text("Pick an Image to proccess !!!")
            }
            else{
                ProgressView()
            }
        }
        .onChange(of: homeData.value, perform: { (_) in
            homeData.updateEffect()
        })
        .onChange(of: homeData.imageData, perform: {(_) in
            
            homeData.allImages.removeAll()
            homeData.mainView = nil
            homeData.loadFilters()
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action:{
                    homeData.imagePicker.toggle()
                }){
                   Image(systemName: "photo")
//                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .font(.title2)
                        
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action:{
                    UIImageWriteToSavedPhotosAlbum(homeData.mainView.image, nil, nil, nil)
                }){
                   Image(systemName: "square.and.arrow.up.fill")
                        .font(.title2)
                }.disabled(homeData.mainView == nil ? true : false)
            }
        }
        .sheet(isPresented: $homeData.imagePicker){
            ImagePicker(picker: $homeData.imagePicker, imageData: $homeData.imageData)
        }
    }
}
