# Demo_ObserverPattern

- 싱글톤 모델과 옵저버 패턴을 사용한 데모 프로젝트
- 각 뷰 단에 서브 뷰의 Depth(깊이) 가 많아지는 상황일 때 사용 용이
- 버튼 클릭 시 [TopSubView], [BottomSubView] 배경색 랜덤 변경

## ProjectMain

- 프로젝트 메인 관련 그룹

## ProjectUtil

- 프로젝트 설정 및 파일 관련 그룹

## MainView

- 표시 뷰
- [MainViewManager] 싱글톤 모델
- [TopSubView] 윗 부분에 출력되는 뷰
- [BottomSubView] 아랫 부분에 출력되는 뷰
