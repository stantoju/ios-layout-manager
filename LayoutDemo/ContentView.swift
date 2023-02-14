//
//  ContentView.swift
//  LayoutDemo
//
//  Created by Toju on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Container().edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Container: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(rootViewController: ShopVC())
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = UIViewController
    
    
}
