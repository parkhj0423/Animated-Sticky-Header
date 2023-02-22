//
//  Extensions.swift
//  Animated-Sticky-Header
//
//  Created by 박현우 on 2023/02/22.
//

import Foundation
import SwiftUI

extension [Destination] {
    var type : DestinationType {
        if let firstDestination = self.first {
            return firstDestination.type
        }
        
        return .sky
    }
}


struct OffsetKey : PreferenceKey {
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> CGRect) {
        value = nextValue()
    }
}


extension View {
    @ViewBuilder
    func offset(_ coordinateSpace : AnyHashable, completion : @escaping (CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .named(coordinateSpace))
                    
                    Color.clear
                        .preference(key : OffsetKey.self, value: rect)
                        .onPreferenceChange(OffsetKey.self, perform: completion)
                }
            }
    }
}

extension View {
    @ViewBuilder
    func checkAnimationEnd<Value : VectorArithmetic>(for value : Value, completion : @escaping () -> ()) -> some View {
        self
            .modifier(AnimationOnEndCallback(for: value, onEnd: completion))
    }
}

/// Animation onEnd Callback

struct AnimationOnEndCallback<Value : VectorArithmetic> : Animatable, ViewModifier {
    var animatableData: Value {
        didSet {
            checkIfFinished()
        }
    }
    
    var endValue : Value
    var onEnd : () -> ()
    
    init(for value: Value, onEnd: @escaping () -> Void) {
        self.animatableData = value
        self.endValue = value
        self.onEnd = onEnd
    }
    
    func body(content: Content) -> some View {
        content
    }
    
    private func checkIfFinished() {
        if endValue == animatableData {
            DispatchQueue.main.async {
                onEnd()
            }
        }
    }
    
}
