//
//  PreviewScreen.swift
//  WallpaperApp
//
//  Created by Husnain on 22/08/2022.
//

import SwiftUI
import GoogleMobileAds
struct PreviewScreen: View {
    
    @State var fullScreenAd: Interstitial?
    let number: String
    @State var userData = UserDefaults.standard.array(forKey: "favouriteImages") as? [String] ?? [String]()
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State var downloadStatus = false
    
    
    
    @State var favoriteToggle = false;
    
    @Binding var showPreviewScreen: Bool
    
    var body: some View {
        VStack{
            HStack {
                  Spacer()
                  GADBannerViewController()
                      .frame(width: kGADAdSizeSmartBannerPortrait.size.width, height: kGADAdSizeSmartBannerPortrait.size.height)
                  Spacer()
            }
            ScrollView(showsIndicators: false) {
                Image("\(self.number)")
                    .resizable()
                    .scaledToFit()
                    .aspectRatio(contentMode: .fit)
                
                
                HStack{
                    Spacer()
                    Button(action:{
                        print("pic name \(self.number)")
                       
                        inputImage = UIImage(named: self.number)
                        
                        guard let inputImage = inputImage else { return }

                        let imageSaver = ImageSaver(downloadStatus: self.$downloadStatus)
                           imageSaver.writeToPhotoAlbum(image: inputImage)
                        self.fullScreenAd?.showAd()
                    }){
                        Image(systemName: "square.and.arrow.down")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    if(self.downloadStatus){
                        VStack{
                            Text("Wallpaper saved")
                        }
                    }
                    
                    Spacer()
                    Button(action:{
                        userData.append(self.number)
                        UserDefaults.standard.set(userData, forKey: "favouriteImages")
                        self.favoriteToggle.toggle()
                        print(userData);
                    }){
                        Image(systemName: self.favoriteToggle ?  "heart.fill":"suit.heart")
                            .renderingMode(.template)
                            .foregroundColor(self.favoriteToggle ? .red:.black)
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
//                    Image(systemName: "ellipsis")
//                        .font(.title)
//                        .foregroundColor(.black)
//                    Spacer()
                }
//                .background(Color.black)
                .cornerRadius(12)
                .padding(.vertical)
                
//                Button(action: {
//
//                }){
//                    Text("Download Wallpaper")
//                        .foregroundColor(.white)
//                        .font(.headline)
//                        .fontWeight(.bold)
//                        .padding()
//
//                }
//                .background(Color.black)
//                .cornerRadius(12)
//                .padding(.vertical)
               
                
            }
           
                
        }
        .onAppear{
            fullScreenAd = Interstitial()
            self.fullScreenAd?.showAd()
        }
        .padding()
        .navigationBarTitle("Preview")
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        image = Image(uiImage: inputImage)
    }
}


class ImageSaver: NSObject {
    @Binding var downloadStatus: Bool
    
    init(downloadStatus: Binding<Bool>) {
            _downloadStatus = downloadStatus
            //self.joinDate = joinDate
    }
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }

    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        self.downloadStatus = true
    }
}
