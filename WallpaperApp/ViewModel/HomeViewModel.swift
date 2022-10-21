//
//  HomeViewModel.swift
//  WallpaperApp
//
//  Created by Husnain on 08/09/2022.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

class HomeViewModel: ObservableObject {
    
    @Published var imagePicker = false
    @Published var imageData = Data(count: 0)
    
    @Published var allImages: [FilteredImage] = []
    
    
    @Published var mainView: FilteredImage!
    
    @Published var value :CGFloat = 1.0
    
    
    
    let filters: [CIFilter] = [
        
        CIFilter.sepiaTone(),CIFilter.comicEffect(),CIFilter.colorInvert(),CIFilter.photoEffectFade(),CIFilter.colorMonochrome(), CIFilter.photoEffectChrome(),CIFilter.gaussianBlur(),CIFilter.bloom()
    ]
    
    
    func loadFilters(){
        
        let context = CIContext()
        
        filters.forEach{(filter) in
            
            
            DispatchQueue.global(qos: .userInteractive).async {
                let CiImage = CIImage(data: self.imageData)
                
                filter.setValue(CiImage!, forKey: kCIInputImageKey)
                
                guard let newImage = filter.outputImage else{return}
                
                
                let cgimage = context.createCGImage(newImage, from: newImage.extent)
                
                let isEditable = filter.inputKeys.count > 1
                
                let filteredData = FilteredImage(image: UIImage(cgImage: cgimage!), filter: filter , isEditable: isEditable)
                
               
                
                DispatchQueue.main.async {
                    self.allImages.append(filteredData)
                    
                    if self.mainView == nil{
                        self.mainView = self.allImages.first
                    }
                }
            }
            
            
        }
    }
    
    
    func updateEffect(){
        
        let context = CIContext()
        
        DispatchQueue.global(qos: .userInteractive).async {
            let CiImage = CIImage(data: self.imageData)
            
            let filter = self.mainView.filter
            
            filter.setValue(CiImage!, forKey: kCIInputImageKey)
            
            if filter.inputKeys.contains("inputRadius"){
                filter.setValue(self.value * 10, forKey: kCIInputRadiusKey)
            }
            
            if filter.inputKeys.contains("inputIntensity"){
                filter.setValue(self.value, forKey: kCIInputIntensityKey)
            }
            guard let newImage = filter.outputImage else{return}
            
            
            let cgimage = context.createCGImage(newImage, from: newImage.extent)
            
            
            DispatchQueue.main.async {
               
                //updating view
                
                self.mainView.image = UIImage(cgImage: cgimage!)
            }
        }
    }
    
    
}

//struct HomeViewModel_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeViewModel()
//    }
//}
