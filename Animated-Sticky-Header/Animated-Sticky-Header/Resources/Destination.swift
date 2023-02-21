//
//  Destination.swift
//  Animated-Sticky-Header
//
//  Created by 박현우 on 2023/02/20.
//

import Foundation

struct Destination : Identifiable, Hashable {
    var id : UUID = UUID()
    var type : DestinationType
    var title : String
    var subTitle : String
    var price : String
    var image : String
}

enum DestinationType : String, CaseIterable {
    case mountain = "Mountain"
    case rock = "Rock"
    case sea = "Sea"
    case sky = "Sky"
    case tree = "Tree"
    case waterfall = "WaterFall"
}

var destinations : [Destination] = [
    // sky
    Destination(type: .sky, title: "맑은 하늘", subTitle: "마음이 편안해진다.", price: "$1299", image: "sky1"),
    Destination(type: .sky, title: "노을", subTitle: "해가 진다.", price: "$2999", image: "sky2"),
    Destination(type: .sky, title: "해 지기 직전의 하늘", subTitle: "조금 무서운 색이다.", price: "$1299", image: "sky3"),
    Destination(type: .sky, title: "초원과 하늘", subTitle: "시원한 바람.", price: "$999", image: "sky4"),
    Destination(type: .sky, title: "뭉게뭉게 구름", subTitle: "뛰어 놀고 싶다.", price: "$1099", image: "sky5"),
    Destination(type: .sky, title: "오묘한 색의 하늘과 달", subTitle: "에메랄드 빛 하늘", price: "$399", image: "sky6"),
    Destination(type: .sky, title: "성층권에서의 하늘", subTitle: "비행기에서 보면 이런느낌일까", price: "$2499", image: "sky7"),
    Destination(type: .sky, title: "멍하니 보면 움직이는 하늘", subTitle: "착시현상일지도", price: "$599", image: "sky8"),
    
    // tree
    Destination(type: .tree, title: "tree1", subTitle: "소나무", price: "$399", image : "tree1"),
    Destination(type: .tree, title: "tree2", subTitle: "대나무", price: "$1099", image : "tree2"),
    Destination(type: .tree, title: "tree3", subTitle: "사과나무", price: "$99", image : "tree3"),
    Destination(type: .tree, title: "tree4", subTitle: "tree4", price: "$599", image : "tree4"),
    Destination(type: .tree, title: "tree5", subTitle: "tree5", price: "$399", image : "tree5"),
    Destination(type: .tree, title: "tree6", subTitle: "tree6", price: "$2099", image : "tree6"),
    Destination(type: .tree, title: "tree7", subTitle: "tree7", price: "$1999", image : "tree7"),

    // waterFall
    Destination(type: .waterfall, title: "waterFall1", subTitle: "waterFall1", price: "$999", image : "waterfall1"),
    Destination(type: .waterfall, title: "waterFall2", subTitle: "waterFall2", price: "$1199", image : "waterfall2"),
    Destination(type: .waterfall, title: "waterFall3", subTitle: "waterFall3", price: "$399", image : "waterfall3"),
    Destination(type: .waterfall, title: "waterFall4", subTitle: "waterFall4", price: "$399", image : "waterfall4"),
    Destination(type: .waterfall, title: "waterFall5", subTitle: "waterFall5", price: "$399", image : "waterfall5"),
    Destination(type: .waterfall, title: "waterFall6", subTitle: "waterFall6", price: "$1599", image : "waterfall6"),

    // mountain
    Destination(type: .mountain, title: "Mountain1", subTitle: "Mountain1", price: "$499", image : "mountain1"),
    Destination(type: .mountain, title: "Mountain2", subTitle: "Mountain2", price: "$199", image : "mountain2"),
    Destination(type: .mountain, title: "Mountain3", subTitle: "Mountain3", price: "$399", image : "mountain3"),
    Destination(type: .mountain, title: "Mountain4", subTitle: "Mountain4", price: "$699", image : "mountain4"),
    Destination(type: .mountain, title: "Mountain5", subTitle: "Mountain5", price: "$399", image : "mountain5"),

    // rock
    Destination(type: .rock, title: "rock1", subTitle: "rock1", price: "$399", image : "mountain1"),
    Destination(type: .rock, title: "rock2", subTitle: "rock2", price: "$4399", image : "mountain2"),
    Destination(type: .rock, title: "rock3", subTitle: "rock3", price: "$199", image : "mountain3"),
    Destination(type: .rock, title: "rock4", subTitle: "rock4", price: "$799", image : "mountain4"),
    Destination(type: .rock, title: "rock5", subTitle: "rock5", price: "$599", image : "mountain5"),
    Destination(type: .rock, title: "rock6", subTitle: "rock6", price: "$399", image : "mountain6"),
    Destination(type: .rock, title: "rock7", subTitle: "rock7", price: "$99", image : "mountain7"),
    
    // sea
    Destination(type: .sea, title: "sea1", subTitle: "sea1", price: "$1299", image : "sea1"),
    Destination(type: .sea, title: "sea2", subTitle: "sea2", price: "$399", image : "sea2"),
    Destination(type: .sea, title: "sea3", subTitle: "sea3", price: "$299", image : "sea3"),
    Destination(type: .sea, title: "sea4", subTitle: "sea4", price: "$1599", image : "sea4"),
    Destination(type: .sea, title: "sea5", subTitle: "sea5", price: "$2299", image : "sea5")
]
