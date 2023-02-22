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
    @State private var destinationBasedOnType : [[Destination]] = []
    @State private var animationProgress : CGFloat = 0
    
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing : 15, pinnedViews: [.sectionHeaders]) {
                    Section {
                        ForEach(destinationBasedOnType, id : \.self) { destinations in
                            destinationSectionView(destinations)
                        }
                    } header: {
                        scrollableTabs(scrollViewProxy)
                    }
                }
            }
        }
        .coordinateSpace(name: "CONTENTVIEW")
        .navigationTitle("Destination")
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.blue, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .background {
            Rectangle()
                .fill(Color.white)
                .ignoresSafeArea()
        }
        .onAppear {
            // 1번만 적용되기 위함
            guard destinationBasedOnType.isEmpty else { return }
            
            for type in DestinationType.allCases {
                let destinations = destinations.filter { $0.type == type }
                destinationBasedOnType.append(destinations)
            }

        }
    }
    
    private func destinationSectionView(_ destinations : [Destination]) -> some View {
        VStack(alignment: .leading, spacing: 15) {
            if let firstDestination = destinations.first {
                Text(firstDestination.type.rawValue)
                    .font(.title)
                    .fontWeight(.semibold)
            }
            
            ForEach(destinations) { destination in
                destinationRowView(destination)
            }
        }
        .padding(15)
        .id(destinations.type)
        .offset("CONTENTVIEW") { rect in
            let minY = rect.minY
            if (minY < 30 && -minY < (rect.midY / 2) && activeTab != destinations.type) && animationProgress == 0 {
                withAnimation(.easeOut(duration: 0.3)) {
                    activeTab = (minY < 30 && -minY < (rect.midY / 2) && activeTab != destinations.type) ? destinations.type : activeTab
                }
            }
        }
    }
    
    private func destinationRowView(_ destination : Destination) -> some View {
        HStack(spacing: 15) {
            Image(destination.image)
                .resizable()
                .clipShape(Circle())
                .frame(width: 120, height: 120)
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(Color.cyan)
                }
            
            VStack(alignment: .leading, spacing : 8) {
                Text(destination.title)
                    .font(.title3)
                
                Text(destination.subTitle)
                    .font(.callout)
                    .foregroundColor(.gray)
                
                Text(destination.price)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.blue)
            }
        }
        .frame(maxWidth : .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    private func scrollableTabs(_ proxy : ScrollViewProxy) -> some View {
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
                        .id(type.tabID)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                activeTab = type
                                animationProgress = 1.0
                                proxy.scrollTo(type, anchor : .topLeading)
                            }
                        }
                }
            }
            .padding(.vertical, 15)
            .onChange(of: activeTab) { newValue in
                withAnimation(.easeInOut(duration: 0.3)) {
                    proxy.scrollTo(newValue.tabID, anchor: .center)
                }
            }
            .checkAnimationEnd(for: animationProgress) {
                animationProgress = 0.0
            }
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
