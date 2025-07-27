//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Amritesh on 27/07/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherDataView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                    temp: isNight ? 62 : 76)
                
                HStack(spacing: 20) {
                    WeatherDayView(
                        weatherData: WeatherDataModel(dayOfWeek: "TUE",
                                                      imageName: "cloud.sun.fill",
                                                      temp: 76)
                    )
                    
                    WeatherDayView(
                        weatherData: WeatherDataModel(dayOfWeek: "WED",
                                                      imageName: "wind.snow",
                                                      temp: 64)
                    )
                    
                    WeatherDayView(
                        weatherData: WeatherDataModel(dayOfWeek: "THU",
                                                      imageName: "smoke.fill",
                                                      temp: 72)
                    )
                    
                    WeatherDayView(
                        weatherData: WeatherDataModel(dayOfWeek: "FRI",
                                                      imageName: "moon.stars.fill",
                                                      temp: 55)
                    )
                    
                    WeatherDayView(
                        weatherData: WeatherDataModel(dayOfWeek: "SAT",
                                                      imageName: "sun.max.fill",
                                                      temp: 80)
                    )
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButtonView(text: "Change Day Time", backgroundColor: .white, textColor: .blue)
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var weatherData: WeatherDataModel
    
    var body: some View {
        VStack{
            Text(weatherData.dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            
            Image(systemName: weatherData.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(weatherData.temp)°")
                .font(.system(size: 28, weight: .medium, design: .default))
                .foregroundStyle(.white)
        }
    }
}


struct BackgroundView: View {
    
    @Binding var isNight: Bool // use binding only when you want to also edit the state if its read only as in this case just use the same state
    
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding(.top, 30)
    }
}

struct MainWeatherDataView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium, design: .default))
                .foregroundColor(.white)
        }.padding(.bottom, 80)
    }
}
