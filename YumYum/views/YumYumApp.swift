//
//  YumYumApp.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

@main
struct YumYumApp: App {
    @StateObject var cartViewModel = CartViewModel()

    var body: some Scene {
        WindowGroup {
            TabViewNav()
                .environmentObject(cartViewModel)
        }
    }
}


