//
//  WebView.swift
//  H4X0R-SwiftUI
//
//  Created by Khue on 30/11/2022.
//

import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    typealias UIViewType = WKWebView
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeurl = urlString {
            if let url = URL(string: safeurl) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}

