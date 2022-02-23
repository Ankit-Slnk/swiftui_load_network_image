//
//  Utility.swift
//  load Network Image
//
//  Created by WEBBRAINS on 23/02/22.
//

import Foundation
import SwiftUI
import URLImage

class Utility {
    static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
//    static func progress(isLoading: Binding<Bool>) -> some View{
//        HStack{}
//            .fillParent()
//            .background(Color.black.opacity(0.5))
//            .toast(isPresenting: .constant(true)){
//                AlertToast(type: .loading)
//            }
//            .isHidden(!isLoading.wrappedValue)
//            .ignoresSafeArea()
//    }
    
    static func urlImage(url : String, padding: CGFloat, height: CGFloat, width: CGFloat) -> some View {
        URLImage(URL(string: url.isEmpty ? "123" : url)!,
                 failure: { error, retry in
                    Image("image_error")
                        .resizable()
                        .frame(width: width, height: height)
                 }, content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .padding(padding)
                        .frame(width: width, height: height)
                 })
    }
    
    static func urlImageCornerShadow(url : String, padding: CGFloat) -> some View {
        URLImage(URL(string: url.isEmpty ? "123" : url)!,
                 failure: { error, retry in
                    Image("image_error")
                 }, content: { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(height: 150, alignment: .center)
                        .cornerRadius(8)
                        .shadow(radius: 2)
                        .padding(padding)
                 })
    }
    
    static func getDateFormat(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let date = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "dd MMM yyyy"
        if date == nil {
            return ""
        }
        return dateFormatter.string(from: date!)
    }
}
