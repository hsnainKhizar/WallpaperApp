//
//  ImagePicker.swift
//  WallpaperApp
//
//  Created by Husnain on 08/09/2022.
//

import SwiftUI
import PhotosUI


struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var picker: Bool
    
    @Binding var imageData: Data
    
    class Coordinator: NSObject, PHPickerViewControllerDelegate{
        
        var parent: ImagePicker
        
        init(parent: ImagePicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]){
            
            if !results.isEmpty {
                
                //checking image can be loaded
                if results.first!.itemProvider.canLoadObject(ofClass: UIImage.self){
                    
                    results.first!.itemProvider.loadObject(ofClass: UIImage.self) {
                        (image, err) in
                        
                        DispatchQueue.main.async {
                            self.parent.imageData = (image as! UIImage).pngData()!
                            self.parent.picker.toggle()
                        }
                    }
                }
                
            }
            else{
                self.parent.picker.toggle()
            }
        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        return ImagePicker.Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let picker = PHPickerViewController(configuration: PHPickerConfiguration())
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: PHPickerViewController,context: Context) {
        
    }
    
}


//struct ImagePicker_Previews: PreviewProvider {
//    static var previews: some View {
//        ImagePicker()
//    }
//}
