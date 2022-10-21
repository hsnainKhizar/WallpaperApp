//
//  ContentView.swift
//  WallpaperApp
//
//  Created by Husnain on 22/08/2022.
//

import SwiftUI
import GoogleMobileAds

struct ContentView: View {
   
    @State var width = UIScreen.main.bounds.width - 90
    @State var x = -UIScreen.main.bounds.width + 90
    
    var body: some View {
        //        HomeView()
        NavigationView {
            Home()
        }
        .navigationBarHidden(true)
    }
}



struct HomeView: View{
      
//    @State var fullScreenAd: Interstitial?
    
       
    
    @Binding var x : CGFloat
    
    @State var showPreviewScreen: Bool = false
    var body: some View{
        
        VStack{
            ZStack{
                
                WallView(x: self.$x, showPreviewScreen: self.$showPreviewScreen)
                
            }
        }.onAppear{
//            fullScreenAd = Interstitial()
//            self.fullScreenAd?.showAd()
        }
    }
}

struct Home: View{
    @State var width = UIScreen.main.bounds.width - 90
    @State var x = -UIScreen.main.bounds.width + 90
    
    
    var body: some View {
        //      HomeView()
        
        ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
            HomeView(x: $x)
            
            SlideMenu()
                .shadow(color: Color.black.opacity( x == 0 ? 0.1 : 0), radius: 5, x: 5, y: 0)
                .offset(x: x)
                .background(Color.black.opacity(x == 0 ? 0.5 : 0).ignoresSafeArea(.all, edges: .vertical).onTapGesture {
                    withAnimation{
                        x = -width
                    }
                })
        }
       
        .gesture(DragGesture().onChanged({ (value) in
            
            //            withAnimation{
            //                if value.translation.width > 0{
            //                    if x < 0{
            //                        x = -width + value.translation.width
            //                    }
            //                }else{
            //                    x = value.translation.width
            //                }
            //            }
        }).onEnded({ (value) in
            
            //            withAnimation{
            //                if -x < width / 2{
            //                    x = 0
            //                }else{
            //
            //                    x = -width
            //
            //                }
            //            }
        }))
        
    }
}







//sub images view






//imagegetter extension

//struct ImagePicker: UIViewControllerRepresentable {
//
//    @Environment(\.presentationMode)
//    var presentationMode
//
//    @Binding var image: Image?
//
//    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
//
//        @Binding var presentationMode: PresentationMode
//        @Binding var image: Image?
//
//        init(presentationMode: Binding<PresentationMode>, image: Binding<Image?>) {
//            _presentationMode = presentationMode
//            _image = image
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController,
//                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//            let uiImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
//            image = Image(uiImage: uiImage)
//            presentationMode.dismiss()
//
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            presentationMode.dismiss()
//        }
//
//    }
//
//    func makeCoordinator() -> Coordinator {
//        return Coordinator(presentationMode: presentationMode, image: $image)
//    }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//        let picker = UIImagePickerController()
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController,
//                                context: UIViewControllerRepresentableContext<ImagePicker>) {
//
//    }
//
//}

