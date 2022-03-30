###  ✨ Movie Review contents Curation App  ✨
```
아직 개발중인 프로젝트입니다.
개발중인 구현물은 테블릿 시뮬레이터로(Ipad 12.9권장) 확인하실 수 있습니다!
```


<img src="https://user-images.githubusercontent.com/75591730/160607656-74d4411f-8700-487e-8dcb-51e3283cbc79.png" width="600">

## 목차
- [개발 동기](#개발-동기)
- [요약](#요약)
- [고민한 키워드](#고민한-키워드)
- [보완 및 구현 계획](#보완-및-구현-계획)
- [구현 결과](#구현-결과)


## 개발 동기
볼거리가 넘처내는 시대에서 사람들은 어떤 컨텐츠를 볼지 방황하는 시간도 길어지고 있습니다. 그래서 현대인들은 더 이상 영화 평점이나 포스터가 아니라 어떤 영화를 찾아볼지 도움을 주는 컨텐치 리뷰 영상(유튜브)을 즐겨 보고 있죠.<br>
하지만 막상 유튜브에 `영화 리뷰`라고 검색하면 영화나 드라마 컨텐츠가 시사하고자 하는 바와는 전혀 관련없는 자극적인 썸네일와 제목으로 도배되어 있습니다. 흔히 말하는 `어그로` 컨텐츠들이 많습니다.<br>

그래서 좀 더 질 좋은 영화 & 드라마 컨텐츠 리뷰 영상 검색을 도와주고 컨텐츠 큐레이션을 도와주는 어플리케이션을 구상하고 개발중에 있습니다.





## 요약

| Index | Detail                                                                                                                                                                                                                              |
|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 기여    | 100% (개발, 기획, 디자인)                                                                                                                                                                                                                  |
| 구현 영상 | https://youtu.be/4XACPL2Ru0M                                                                                                                                                                                      |
| 구현 기간 | **2022.03.4~(진행중)**                                                                                                                                                                                                                 |
| 기술 스택 | - Flutter                                                                                                                                                                                                                           |
| 구현 기능 | - TMDB API를 호출하여 인기 영화, 드라마 등의 컨텐츠 데이터를 Fetch <br/> - Youtube API를 Query값을 넣어 필요한 리뷰 컨텐츠 호출 <br> - LayoutBuilder를 이용하여 Tablet과 Mobile 디바이스마다 각각 다른 위젯(스크린) 호출  <br> - 디바이스 별 필요 Orientation 적용  <br> - 윕뷰를 사용하여 Youtube사이트로 이동 <br> | 



## 고민한 키워드
- PageView Routing
  - Animation Controller Issue
  - Route State 관리
    - 이전 화면으로 돌아갈 때 기존 화면에 State값 유지 or 초기화
    - 스크린이 전환 될 때마다 불필요한 렌더링 방지
    

  
- Responsive Layout 
  - 여러 디바이스에 대응하기 위해 가장 좋은 구조는?
  - BeakPoint를 기준으로 디바이스에 맞는 레이아웃을 반환하는 모듈 구현



- MVVVM
  - 어떤 이점이 있는지 
  - 어떻게 적용해야될지 
    - Stanford IOS 강의 참고 



- WheelScrollView
  - 영상 데이터를 담고 있는 위젯을 `WheelScrollView`를 사용하며 앱 과부하가 너무 심함
  - 아직 위젯 자체가 안정성이 떨어짐
    - 우회할 방법은 없는지
      - 로직을 살짝 변경
  

- 불필요 Rendering을 줄이자
  - 필요할 때만 Statefull 위젯을 사용
  - 간단한 State 변경은 React Hook 사용
    - 퍼포먼스에서 얼마나 이점이 있는지 확인 필요
  - Pageview Builder 라우팅에서 렌더링 최소화

- Youtube API & TMDB
  - 네트워크 호출은 어떤 레이어에서 담당하는게 좋을지
  - Nested Model Data는 어떻게 관리하는게 좋을지 
  - 모듈화 할 수 없을까?
  

- Clean Code 
  - 스파게티 코드 지양
  - 중복코드 지양. 재사용 가능한 위젯 모듈 생성
    - 코드 분할 규칙 설정
  - 더 고민해야될 요소는?

## 보완 및 구현 계획
- 기획 & 디자인
  - 기획 디자인이 어느정도 완성이 된 후 개발 진행

- 필요 스크린 & 위젯 구현

- 로그인
  - 소셜 로그인
    - 애플, 구글, 카카오톡


- Youtube API Query 튜닝 필요
  - 더 관련 있는 컨텐츠를 호출하기 위해 튜닝 작업 필요
  

- Youtube API 호출 횟수 제한 이슈
  - 앱을 배포한다고 했을 때 일일 기준 Youtube API 쿼리를 호출할 수 있는 횟수에 제한이 있음
    - 일일 쿼리를 다 사용하면 크롤링 데이터를 사용해야됨

- TestCode 작성

- 포퍼먼스 체크


## 구현 결과
_(이미지에 약간의 딜레이가 있습니다)_


|                                                        런치 스크린 (변경 예정)                                                         |                                                      홈 포스터 슬라이더 (Scroll)                                                      |
|:-----------------------------------------------------------------------------------------------------------------------------:|:-----------------------------------------------------------------------------------------------------------------------------:|
| <img src="https://user-images.githubusercontent.com/75591730/160587558-17c0b1fd-ac2f-4a7a-9b2d-45d1b59487f3.gif" width="600"> | <img src="https://user-images.githubusercontent.com/75591730/160587998-89766167-40f8-47b3-9cac-84bc1eafbc00.gif" width="600"> |
|                                                 홈 포스터 슬라이더 (Scroll on touch)                                                  |                                                        예고편 보기 (홈 스크린)                                                         |
| <img src="https://user-images.githubusercontent.com/75591730/160588252-c502d219-c5ea-4cc2-9938-8f7a031df1cc.gif" width="600"> | <img src="https://user-images.githubusercontent.com/75591730/160588948-30412919-57f9-42e6-b5a6-93bede027536.gif" width="600"> |
|                                                          네비게이션 바 라우팅                                                          |                                                            카테고리 변경                                                            |
| <img src="https://user-images.githubusercontent.com/75591730/160589354-ab8efd4c-a831-4718-95dd-87d7b1997e97.gif" width="600"> | <img src="https://user-images.githubusercontent.com/75591730/160589735-8a688387-18c0-4559-b54c-21578395f6f3.gif" width="600"> |
|                                                         컨텐츠 상세 페이지 이동                                                         |                                                        컨텐츠 상세 페이지 슬라이더                                                        |
| <img src="https://user-images.githubusercontent.com/75591730/160589879-936a624f-3bbe-4965-a721-f35cb450ef00.gif" width="600"> | <img src="https://user-images.githubusercontent.com/75591730/160590090-43366cdf-0007-4171-884b-6ee65b938b30.gif" width="600"> |
|                                                          유튜브 페이지로 이동                                                          |
| <img src="https://user-images.githubusercontent.com/75591730/160590269-0d61fa2d-85a2-4f1b-afef-7701c73487f3.gif" width="600"> |
