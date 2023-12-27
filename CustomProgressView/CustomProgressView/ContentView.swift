//
//  ContentView.swift
//  CustomProgressView
//
//  Created by phang on 12/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 20) {
                CircularLoaderView()
                RotateImageLoaderView()
                RotateCircleAroundCircle()
            }
            HStack(spacing: 20) {
                AnimatedStrokeRectangle()
                AnimatedStrokeTriangle()
                AnimatedStrokeCircle()
            }
            HStack(spacing: 20) {
                CircleFillLoaderView()
                CirclesLoaderView()
                ModernCircularLoader()
            }
            HStack(spacing: 20) {
                DashCircleLoaderView()
                BottomToTopFill()
                PieSegmentLoader()
            }
        }
        .padding()
    }
}

// MARK: - 
struct CircularLoaderView: View {
    @State private var animate = false
    var size: CGFloat = 80
    let gradient = LinearGradient(
        stops: [
            Gradient.Stop(color: .primary, location: 0.1),
            Gradient.Stop(color: .primary.opacity(0.8), location: 0.4),
            Gradient.Stop(color: .primary.opacity(0.4), location: 0.8)
        ],
        startPoint: .leading,
        endPoint: .trailing
    )
    
    var body: some View {
        Circle()
            .stroke(gradient, lineWidth: 8)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: animate ? 360 : 0))
            .animation(
                Animation.linear(duration: 3)
                    .repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear {
                withAnimation {
                    animate.toggle()
                }
            }
    }
}

// MARK: -
struct RotateImageLoaderView: View {
    @State private var animate = false
    var size: CGFloat = 80
    
    var body: some View {
        Image(systemName: "gear")
            .resizable()
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: animate ? 360 : 0))
            .animation(
                Animation.linear(duration: 3)
                    .repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear {
                withAnimation {
                    animate.toggle()
                }
            }
    }
}

// MARK: -
struct RotateCircleAroundCircle: View {
    @State private var angle: Double = 0
    var timeInterval: TimeInterval = 0.1
    var size: CGFloat = 80

    var body: some View {
        VStack {
            Circle()
                .stroke(.black, lineWidth: 2)
                .frame(width: size, height: size)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 10, height: 10)
                        .offset(
                            x: size / 2 * CGFloat(cos(angle)),
                            y: size / 2 * CGFloat(sin(angle))
                        )
                )
        }
        .onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { _ in
                withAnimation {
                    angle += 0.1
                }
            }
            RunLoop.current.add(timer, forMode: .common)
        }
    }
}

// MARK: -
struct AnimatedStrokeRectangle: View {
    @State private var trimEnd: CGFloat = 0.0
    var size: CGFloat = 80

    var body: some View {
        Rectangle()
            .trim(from: 0.0, to: trimEnd)
            .stroke(.black, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .frame(width: size, height: size)
            .animation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true),
                value: trimEnd
            )
            .onAppear {
                self.trimEnd = 1.0
            }
    }
}

// MARK: -
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.closeSubpath()
        return path
    }
}

struct AnimatedStrokeTriangle: View {
    @State private var trimEnd: CGFloat = 0.0
    var size: CGFloat = 80

    var body: some View {
        Triangle()
            .trim(from: 0.0, to: trimEnd)
            .stroke(.black, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .frame(width: size, height: size)
            .animation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true),
                value: trimEnd
            )
            .onAppear {
                self.trimEnd = 1.0
            }
    }
}

// MARK: -
struct AnimatedStrokeCircle: View {
    @State private var trimEnd: CGFloat = 0.0
    var size: CGFloat = 80

    var body: some View {
        Circle()
            .trim(from: 0.0, to: trimEnd)
            .stroke(.black, style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .frame(width: size, height: size)
            .animation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true),
                value: trimEnd
            )
            .onAppear {
                self.trimEnd = 1.0
            }
    }
}

// MARK: -
struct CircleFillLoaderView: View {
    @State private var trimEnd: CGFloat = 0.0
    var size: CGFloat = 80

    var body: some View {
        Circle()
            .trim(from: 0.0, to: trimEnd)
            .frame(width: size, height: size)
            .animation(
                Animation.easeInOut(duration: 2.0)
                    .repeatForever(autoreverses: true),
                value: trimEnd
            )
            .onAppear {
                trimEnd = 1
            }
    }
}

// MARK: -
struct CirclesLoaderView: View {
    @State private var degree = 270
    var count: Int = 13
    var size: CGFloat = 80

    var body: some View {
        GeometryReader { bounds in
            ForEach(0..<count, id: \.self) { i in
                Circle()
                    .fill(.black)
                    .frame(width: getDotSize(i), height: getDotSize(i), alignment: .center)
                    .offset(x: (bounds.size.width / 2) - 12)
                    .rotationEffect(.degrees(.pi * 2 * Double(i * 5)))
            }
            .frame(width: bounds.size.width, height: bounds.size.height, alignment: .center)
            .rotationEffect(.degrees(Double(degree)))
            .animation(
                Animation.linear(duration: 2)
                    .repeatForever(autoreverses: false),
                value: degree
            )
            .onAppear {
                degree = 270 + 360
            }
        }
        .frame(width: size, height: size)
    }
    private func getDotSize(_ index: Int) -> CGFloat {
        CGFloat(index)
    }
}

// MARK: -
struct ModernCircularLoader: View {
    @State private var trimEnd = 0.6
    @State private var animate = false
    var size: CGFloat = 80

    var body: some View {
        Circle()
            .trim(from: 0.0, to: trimEnd)
            .stroke(.black, style: StrokeStyle(lineWidth: 7, lineCap: .round, lineJoin: .round))
            .animation(
                Animation.easeIn(duration: 1.5)
                    .repeatForever(autoreverses: true), value: trimEnd)
            .frame(width: size, height: size)
            .rotationEffect(Angle(degrees: animate ? 270 + 360 : 270))
            .animation(
                Animation.linear(duration: 3)
                    .repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear {
                animate = true
                trimEnd = 0
            }
    }
}

// MARK: -
struct DashCircleLoaderView: View {
    @State private var trimEnd = 0.6
    @State private var degree = 270
    var size: CGFloat = 80

    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .butt, miterLimit: 0, dash: [10, 3], dashPhase: 0))
                .foregroundColor(.black.opacity(0.2))

            Circle()
                .trim(from: 0.0, to: trimEnd)
                .stroke(style: StrokeStyle(lineWidth: 8, lineCap: .butt, miterLimit: 0, dash: [10, 3], dashPhase: 0))
                .animation(
                    Animation.easeIn(duration: 1.5)
                        .repeatForever(autoreverses: true),
                    value: trimEnd
                )
                .rotationEffect(Angle(degrees: Double(degree)))
                .animation(
                    Animation.linear(duration: 2)
                        .repeatForever(autoreverses: false),
                    value: degree
                )
                .onAppear {
                    degree = 270 + 360
                    trimEnd = 0
                }
        }
        .frame(width: size, height: size)
    }
}

// MARK: -
struct BottomToTopFill: View {
    @State var offset: CGFloat = 80
    var size: CGFloat = 80

    var body: some View {
        ZStack {
            Circle()
                .fill(.clear)
                .frame(width: size, height: size)
                .overlay {
                    Circle()
                        .stroke(.black)
                }
            Rectangle()
                .fill(.black)
                .frame(width: size, height: size)
                .offset(y: offset)
        }
        .clipShape(.circle)
        .animation(
            Animation.linear(duration: 3)
                .repeatForever(autoreverses: true),
            value: offset
        )
        .onAppear {
            offset = 0
        }
    }
}

// MARK: -
struct PieSegment: Shape {
    var start: Angle
    var end: Angle
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        path.addArc(center: center, radius: rect.midX, startAngle: start, endAngle: end, clockwise: false)
        return path
    }
}

struct PieSegmentLoader: View {
    @State var degree: Double = 10
    @State var isFurther = true
    var size: CGFloat = 80
    
    var body: some View {
        PieSegment(start: .zero, end: .degrees(degree))
            .frame(width: size, height: size)
            .animation(
                Animation.linear(duration: 3)
                    .repeatForever(autoreverses: false),
                value: degree
            )
            .onAppear {
                let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
                    withAnimation {
                        if isFurther {
                            if degree <= 360 {
                                degree += 1
                            }
                            if degree == 360 {
                                isFurther = false
                            }
                        } else {
                            if degree > 0 {
                                degree -= 1
                            }
                            if degree == 0 {
                                isFurther = true
                            }
                        }
                    }
                }
                RunLoop.current.add(timer, forMode: .common)
            }
    }
}

#Preview {
    ContentView()
}
