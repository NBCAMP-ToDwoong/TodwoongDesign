

# ToDwoongDesign 라이브러리 문서

ToDwoongDesign 라이브러리는 iOS 애플리케이션 개발을 위한 디자인 시스템을 제공합니다. 

이 라이브러리는 폰트, 컬러, 버튼, 컬렉션뷰 셀, 테이블뷰 셀의 일관된 사용을 통해 UI 개발의 효율성과 일관성을 높입니다.

<br/>

## 설치 방법

SPM으로 간편하게 설치할 수 있습니다.
cocoapod 은 지원하지 않습니다

## 사용 방법

### 폰트


```swift
label.font = TDStyle.font.body(style: .regular)
```
| FontStyle Method | Regular Style                                    | Bold Style                                          | Note      |
|------------------|--------------------------------------------------|-----------------------------------------------------|-----------|
| largeTitle       | `UIFont.preferredFont(forTextStyle: .largeTitle)` | `UIFont.preferredFont(forTextStyle: .largeTitle).withTraits(.traitBold)` |           |
| title1           | `UIFont.preferredFont(forTextStyle: .title1)`     | `UIFont.preferredFont(forTextStyle: .title1).withTraits(.traitBold)`     |           |
| title2           | `UIFont.preferredFont(forTextStyle: .title2)`     | `UIFont.preferredFont(forTextStyle: .title2).withTraits(.traitBold)`     |           |
| title3           | `UIFont.preferredFont(forTextStyle: .title3)`     | `UIFont.preferredFont(forTextStyle: .title3).withTraits(.traitBold)`     |           |
| **body**         | `UIFont.preferredFont(forTextStyle: .body)`       | `UIFont.preferredFont(forTextStyle: .body).withTraits(.traitBold)`       | **Main**  |
| subheadline      | `UIFont.preferredFont(forTextStyle: .subheadline)` | `UIFont.preferredFont(forTextStyle: .subheadline).withTraits(.traitBold)` |           |
| footnote         | `UIFont.preferredFont(forTextStyle: .footnote)`   | `UIFont.preferredFont(forTextStyle: .footnote).withTraits(.traitBold)`   |           |
| caption1         | `UIFont.preferredFont(forTextStyle: .caption1)`   | `UIFont.preferredFont(forTextStyle: .caption1).withTraits(.traitBold)`   |           |
| caption2         | `UIFont.preferredFont(forTextStyle: .caption2)`   | `UIFont.preferredFont(forTextStyle: .caption2).withTraits(.traitBold)`   |           |



### 컬러

```swift
view.backgroundColor = TDStyle.color.primaryFont
```

| Name             | Hex Code  |
|------------------|-----------|
| lightGray        | #F2F2F7   |
| mainTheme        | #5DB075   |
| mainDarkTheme    | #027A48   |
| primaryLabel     | #000000   |
| secondaryLabel   | #8D8D9B   |
| bgGray           | #E4E7EC   |
| bgRed            | #FECDCA   |
| bgOrange         | #FEE4E2   |
| bgYellow         | #FEF0C7   |
| bgGreen          | #D1FADF   |
| bgBlue           | #B9E6FE   |
| bgPurple         | #D9D6FE   |
| textRed          | #B42318   |
| textOrangeYellow | #B54708   |
| textGreen        | #027A48   |
| textBlue         | #026AA2   |
| textPurple       | #5925DC   |



### 버튼

```swift
let chipButton = TDButton.chip(title: "chip", backgroundColor: .systemGray)
let mediumButton = TDButton.medium(title: "medium", backgroundColor: .systemGray)
let largeButton = TDButton.full(title: "fill", backgroundColor: .systemGray)
```

### 컬렉션뷰 셀

컬렉션뷰 셀을 등록하고 사용하는 방법:

```swift
collectionView.register(TDCollectionViewCell.self, forCellWithReuseIdentifier: TDCollectionViewCell.identifier)
```

### 테이블뷰 셀

테이블뷰 셀을 등록하고 사용하는 방법:

```swift
tableView.register(TDTableViewCell.self, forCellWithReuseIdentifier: TDTableViewCell.identifier)
```


## 문의처

추가 질문이나 지원이 필요한 경우, 내일배움캠프 4팀으로 연락 주세요.

