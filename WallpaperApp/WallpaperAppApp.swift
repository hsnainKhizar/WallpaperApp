//
//  WallpaperAppApp.swift
//  WallpaperApp
//
//  Created by Husnain on 22/08/2022.
//

import SwiftUI
import GoogleMobileAds


@main
struct WallpaperAppApp: App {
    
    init(){
        GADMobileAds.sharedInstance()
            .start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
