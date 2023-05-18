//
//  NavigationBarWithButton.swift
//  MyAssets
//
//  Copyright (c) 2023 oasis444. All right reserved.
//

import SwiftUI

struct NavigationBarWithButton: ViewModifier {
    
    var title: String = ""
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(title)
                        .font(.system(size: 24, weight: .bold))
                        .padding()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("자산 추가 버튼 tapped")
                    } label: {
                        Image(systemName: "plus")
                        Text("자산 추가")
                            .font(.system(size: 12))
                    }
                    .foregroundStyle(.black)
                    .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                    .overlay { // ZStack과 비슷하게 겹치기 가능
                        RoundedRectangle(cornerRadius: 10)
                            .stroke()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.configureWithTransparentBackground()
                appearance.backgroundColor = UIColor(white: 1, alpha: 0.5)
                UINavigationBar.appearance()
                    .standardAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
    }
}

extension View {
    func navigaionBarWithButtonStyle(_ title: String) -> some View {
        return self.modifier(NavigationBarWithButton(title: title))
    }
}

struct NavigationBarWithButton_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            Color.gray.edgesIgnoringSafeArea(.all)
                .navigaionBarWithButtonStyle("내 자산")
        }
    }
}
