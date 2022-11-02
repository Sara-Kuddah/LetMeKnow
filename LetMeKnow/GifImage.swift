//
//  GifImage.swift
//  LetMeKnow
//
//  Created by Sara Khalid BIN kuddah on 06/04/1444 AH.
//

import SwiftUI
import WebKit

struct GifImage: UIViewRepresentable {
    private let name: String
    
    init(_ name: String){
        self.name = name
    }
    func makeUIView(context: Context) -> WKWebView  {
        let webView = WKWebView()
        let url = Bundle.main.url(forResource: name, withExtension: "gif")
       // do{
            
            let data = try!  Data(contentsOf: url!)
//        }
//        catch{
//
//        }
       
        
        webView.load(
            data,
        mimeType: "image/gif",
        characterEncodingName: "UTF-8",
        baseURL: (url?.deletingLastPathComponent())!
        )
        
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.reload()
        
    }
}

struct GifImage_Previews: PreviewProvider {
    static var previews: some View {
        GifImage("logo")
            .background( Color(.red).opacity(0.1))
            .frame(width: 200, height: 200)
    }
}
