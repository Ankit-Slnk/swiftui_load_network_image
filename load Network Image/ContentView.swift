//
//  ContentView.swift
//  load Network Image
//
//  Created by WEBBRAINS on 23/02/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Utility.urlImage(url: "https://wallpaperaccess.com/full/197542.jpg", padding: CGFloat(0), height: 250, width: 250)
            .frame(height: 250)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
