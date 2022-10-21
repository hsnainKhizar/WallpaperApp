//
//  BannerView.swift
//  WallpaperApp
//
//  Created by Husnain on 15/09/2022.
//

import GoogleMobileAds
import SwiftUI
import UIKit

struct GADBannerViewController: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }
    
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let view = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        let viewController = UIViewController()
        view.adUnitID = "ca-app-pub-7661408372715298/4087328636"
        view.rootViewController = viewController
        viewController.view.addSubview(view)
        viewController.view.frame = CGRect(origin: .zero, size: kGADAdSizeSmartBannerPortrait.size)
        view.load(GADRequest())
        return viewController
    }
}

//struct BannerView_Previews: PreviewProvider {
//    static var previews: some View {
//        BannerView()
//    }
//}
