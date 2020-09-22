# AutolaoutTableViewSample

AutoLoyout TableView Sample \
![](AutolayoutTableView.gif)

## 정리
오토레아이아웃 간단 샘플 \
[해당 튜토리얼](https://www.raywenderlich.com/8549-self-sizing-table-view-cells) 참고하여 진행

- Constraint to Margin : 여백을 기준, TableView에서 사용
- Content Hugging Priority : Xcode에게 본래보다 커질경우 여백을 채울 공간을 알려준다.
- '손쉬운 사용' 에 따라 텍스트 크기 변화 
  - Text Styles: 'HeadLIne'
  - Automatically Adjusts Font = YES 
- 오토레이아웃을 통한 테이블뷰 동적 설정
```swift
tableView.rowHeight = UITableView.automaticDimension
```
- 테이블뷰 셀 높이가 새로고침될때, 애니메이션 효과 추가
```swift
tableView.beginUpdates()
tableView.endUpdates()
```
