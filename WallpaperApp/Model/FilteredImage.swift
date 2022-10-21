//
//  FilteredImage.swift
//  WallpaperApp
//
//  Created by Husnain on 08/09/2022.
//
 
import SwiftUI
import CoreImage


struct FilteredImage: Identifiable {
    var id = UUID().uuidString
    var image: UIImage
    var filter: CIFilter
    var isEditable: Bool
}

//struct FilteredImage_Previews: PreviewProvider {
//    static var previews: some View {
//        FilteredImage()
//    }
//}
