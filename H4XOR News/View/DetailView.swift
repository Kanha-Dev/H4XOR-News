//
//  DetailView.swift
//  H4XOR News
//
//  Created by Kanha Gupta on 12/07/24.
//

import SwiftUI

struct DetailView: View {
    
    let url : String?
    
    var body: some View {
        WebView(URL: url)
    }
}

#Preview {
    DetailView(url: "www.google.com")
}
