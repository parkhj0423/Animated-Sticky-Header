//
//  HomeView.swift
//  Animated-Sticky-Header
//
//  Created by 박현우 on 2023/02/19.
//

import SwiftUI

struct HomeView: View {
    
    @State private var activeTab: DestinationType = .sky
    
    @Namespace private var animation
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing : 15, pinnedViews: [.sectionHeaders]) {
                    Section {
                        
                    } header: {
                        scrollableTabs()
                    }
                }
            }
        }
        .navigationTitle("Destination")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.blue, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .background {
            Rectangle()
                .fill(Color.white)
                .ignoresSafeArea()
        }
    }
    
    @ViewBuilder
    private func scrollableTabs() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing : 10) {
                ForEach(DestinationType.allCases, id : \.rawValue) { type in
                    Text(type.rawValue)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                        .background(alignment : .bottom) {
                            if activeTab == type {
                                Capsule()
                                    .fill(.white)
                                    .frame(height: 5)
                                    .padding(.horizontal, -5)
                                    .offset(y: 15)
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        }
                        .padding(.horizontal, 15)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                activeTab = type
                            }
                        }
                }
            }
            .padding(.vertical, 15)
        }
        .background {
            Rectangle()
                .fill(Color.blue)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 5, y: 5)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
