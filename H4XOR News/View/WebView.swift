//
//  WebView.swift
//  H4XOR News
//
//  Created by Kanha Gupta on 12/07/24.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString : String?
    
    let webView : WKWebView
    
    init(URL: String?){
        urlString = URL
        webView = WKWebView(frame: .zero)
    }
    
    func makeUIView(context: Context) -> some UIView {
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeUrl = urlString{
            if let url = URL(string: safeUrl){
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
}
