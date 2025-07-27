//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Amritesh on 28/07/25.
//
import SwiftUI

struct WeatherButtonView: View {
    
    var text: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(text)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .medium, design: .default))
            .cornerRadius(10)
    }
}
