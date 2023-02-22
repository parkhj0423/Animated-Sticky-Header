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
    case sky = "Sky"
    case waterfall = "WaterFall"
    case sea = "Sea"
    case mountain = "Mountain"
    case rock = "Rock"
    case tree = "Tree"
    
    // 탭 스크롤링, 의도치않은 애니메이션을 방지하기 위함
    var tabID : String {
        return self.rawValue + self.rawValue.prefix(4)
    }
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
    Destination(type: .tree, title: "외로운 나무", subTitle: "가지치기 필요", price: "$399", image : "tree1"),
    Destination(type: .tree, title: "고독한 나무와 의자", subTitle: "가고싶다.", price: "$1099", image : "tree2"),
    Destination(type: .tree, title: "몸통이 두꺼운 나무", subTitle: "무슨 나무일까", price: "$99", image : "tree3"),
    Destination(type: .tree, title: "포즈가 독특한 나무", subTitle: "왜저렇게 자랐지", price: "$599", image : "tree4"),
    Destination(type: .tree, title: "올림픽 공원 나무", subTitle: "낮잠 자고싶다.", price: "$399", image : "tree5"),
    Destination(type: .tree, title: "큰 나무", subTitle: "멋있다.", price: "$2099", image : "tree6"),
    Destination(type: .tree, title: "두갈래 나무", subTitle: "배경이 이쁘다", price: "$1999", image : "tree7"),

    // waterFall
    Destination(type: .waterfall, title: "이끼가 많은 폭포", subTitle: "이끼는 미끄러웡", price: "$999", image : "waterfall1"),
    Destination(type: .waterfall, title: "계단식 폭포", subTitle: "신기하다.", price: "$1199", image : "waterfall2"),
    Destination(type: .waterfall, title: "다섯줄기 폭포", subTitle: "그림같다.", price: "$399", image : "waterfall3"),
    Destination(type: .waterfall, title: "입구가 좁아보이는 폭포", subTitle: "입구가 왜이렇게 좁을까", price: "$399", image : "waterfall4"),
    Destination(type: .waterfall, title: "잔잔한 폭포", subTitle: "졸졸졸....", price: "$399", image : "waterfall5"),

    // mountain
    Destination(type: .mountain, title: "에베레스트", subTitle: "높고도 높다.", price: "$499", image : "mountain1"),
    Destination(type: .mountain, title: "그림같은 풍경", subTitle: "한번쯤 가볼 수 있겠지", price: "$199", image : "mountain2"),
    Destination(type: .mountain, title: "끝없는 능선", subTitle: "우리나라 같다.", price: "$399", image : "mountain3"),
    Destination(type: .mountain, title: "바위산", subTitle: "끝없는 바위산", price: "$699", image : "mountain4"),
    Destination(type: .mountain, title: "은하수와 산", subTitle: "직접 한번 보고싶다.", price: "$399", image : "mountain5"),

    // rock
    Destination(type: .rock, title: "지도 무늬 바위", subTitle: "파도같기도 하고", price: "$399", image : "rock1"),
    Destination(type: .rock, title: "돌도끼를 닮은 바위", subTitle: "매우 뾰족하다", price: "$4399", image : "rock2"),
    Destination(type: .rock, title: "바위와 안개", subTitle: "운치있다.", price: "$199", image : "rock3"),
    Destination(type: .rock, title: "각진 바위", subTitle: "누가 깎았나", price: "$799", image : "rock4"),
    Destination(type: .rock, title: "흔들 바위", subTitle: "밀면 떨어질라나", price: "$599", image : "rock5"),
    Destination(type: .rock, title: "3층 바위", subTitle: "바람불면 떨어질거같다.", price: "$399", image : "rock6"),
    Destination(type: .rock, title: "계곡 옆 바위", subTitle: "모양이 독특하다.", price: "$99", image : "rock7"),
    
    // sea
    Destination(type: .sea, title: "소용돌이", subTitle: "빙글뱅글", price: "$1299", image : "sea1"),
    Destination(type: .sea, title: "해변가의 갈매기", subTitle: "끼룩끼룩", price: "$399", image : "sea2"),
    Destination(type: .sea, title: "잔잔한 바다", subTitle: "고요하다.", price: "$299", image : "sea3"),
    Destination(type: .sea, title: "검은 빛의 바다", subTitle: "뭔가 무섭다.", price: "$1599", image : "sea4"),
    Destination(type: .sea, title: "조용한 해변가", subTitle: "사람이 없다.", price: "$2299", image : "sea5")
]
