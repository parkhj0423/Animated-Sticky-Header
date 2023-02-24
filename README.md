# SwiftUI Animated Sticky Header

![ezgif com-video-to-gif (1)](https://user-images.githubusercontent.com/50567986/221222798-0ae692ea-eb50-4320-856d-f95d4790dd63.gif)
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/50567986/221222845-8de55568-f361-4f34-9bc7-a213b5ef9a1e.gif)

### 1. matchedGeometryEffect로 Animated Tab 구현

탭이 바뀔때마다 하단의 흰색 바가 자연스럽게 다른 탭으로 이동하는 애니메이션을 위해 matchedGeometryEffect을 사용하였다. 

namespace를 기준으로 id값에 따라 구동되는 애니메이션을 위해 namespace를 생성한다.

```swift
@Namespace private var animation
```

그리고 각 탭에서 다른 탭으로 이동할 때 matchedGeometryEffect에 namespace와 id값을 추가시킨다.

```swift
ForEach(DestinationType.allCases, id : \.rawValue) { type in
    Text(type.rawValue)
        .background(alignment : .bottom) {
            if activeTab == type {
                Capsule()
                    .fill(.white)
                    .frame(height: 5)
                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
            }
        }
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.3)) {
                activeTab = type
            }
        }
}
```

### 2. 스크롤 위치에 따른 탭 상태 변경

사용자가 스크롤한 스크롤뷰의 위치에 따라 현재 노출되고있는 Section에 맞는 탭으로 상단 탭의 상태를 변경해줄 것이다.

coordinateSpace에 지정한 name을 통해 현재 뷰의 좌표공간에 접근하여 사용이 가능하다.

기준이 될 상위 뷰에 coordinateSpace를 정해주고,

```swift
ScrollViewReader { scrollViewProxy in
		ScrollView(.vertical, showsIndicators: false) {
			  ...
		}
}
.coordinateSpace(name: "CONTENTVIEW")
```

좌표공간에 접근할 다른 뷰에서 사용한다.

minY의 값으로 스크롤뷰의 위치를 계산하여 각 Section의 첫번째 Item이 최상단에 위치할 때 탭이 변경된다.

```swift
.offset("CONTENTVIEW") { rect in
            let minY = rect.minY
            if (minY < 30 && -minY < (rect.midY / 2) && activeTab != destinations.type) && animationProgress == 0 {
                withAnimation(.easeOut(duration: 0.3)) {
                    activeTab = (minY < 30 && -minY < (rect.midY / 2) && activeTab != destinations.type) ? destinations.type : activeTab
                }
            }
        }
```

### 3. 탭 상태에 따른 스크롤 위치 변경

각 탭은 고유한 ID를 가지고 있다. tabID가 존재하는 이유는 의도치않게 애니메이션이 두번 발생하는 경우가 종종 있기 때문이다.

```swift
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
```

스크롤뷰의 위치와 특정 ID값으로의 스크롤 이동을 위해 ScrollViewReader에서 사용할 수 있는 ScrollViewProxy 변수를 사용한다.

```swift
private func scrollableTabs(_ proxy : ScrollViewProxy) -> some View {
	...
}
```

각 Section의 Title은 탭의 고유한 tabID를 가지고 있고 상단의 탭을 선택해 변경될때 해당 tabID가 위치하는 곳으로 ScrollViewProxy를 통해 이동시킬 것이다.

```swift
ForEach(DestinationType.allCases, id : \.rawValue) { type in
        Text(type.rawValue)
            .background(alignment : .bottom) {
                if activeTab == type {
                    Capsule()
                        .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                }
            }
						// ID
            .id(type.tabID)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    activeTab = type
                    proxy.scrollTo(type, anchor : .topLeading)
                }
            }
    }
.onChange(of: activeTab) { newValue in
    withAnimation(.easeInOut(duration: 0.3)) {
        proxy.scrollTo(newValue.tabID, anchor: .center)
    }
}
```

activeTab이 onChange될때 마다 스크롤을 change된 탭의 위치로 이동시킨다.
