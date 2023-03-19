//
//  LaunchScreenView.swift
//  NFTio
//
//  Created by Dariy Kutelov on 18.03.23.
//

import SwiftUI

// MARK: - Assignment 4
struct LaunchScreen: View {
    @State var scaleRatio: CGFloat = 1
    @State var backgroundColor: String = Constants.Colors.terciary
    @State var textVerticalOffset: CGFloat = 500
    @State var rotationAngle: Angle = .degrees(0)
    
    var body: some View {
        ZStack {
            Color(backgroundColor)
           
                VStack {
                    Image(Constants.Text.LaunchScreen.appIcon)
                        .cornerRadius(Constants.Spacing.small)
                        .scaleEffect(scaleRatio)
                        .rotationEffect(rotationAngle)
                }
           
                VStack {
                    Text(Constants.Text.LaunchScreen.headline)
                        .font(.title)
                        .fontWeight(.medium)
                        .foregroundColor(Color(Constants.Colors.darkYellow))
                        .offset(y: textVerticalOffset)
            }
            .onAppear {
                runAnimation()
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

extension LaunchScreen {
    var animationDuration: Double { return 1.0 }
    var animationDelay: Double { return 0.5 }
    
    func runAnimation() {
        let deadline: DispatchTime = .now() + animationDuration
        
        withAnimation(.easeOut(duration: animationDuration)) {
            scaleRatio = 1.5
            backgroundColor = Constants.Colors.secondary
        }
        
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            withAnimation(.easeIn(duration: animationDuration)) {
                scaleRatio = 0.5
                backgroundColor = Constants.Colors.charcoal
                textVerticalOffset = 100
            }
            withAnimation(
                .easeIn(duration: animationDuration)
                .delay(animationDelay)) {
                rotationAngle = .degrees(360)
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
