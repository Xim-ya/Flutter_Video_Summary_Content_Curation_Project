###  ✨ Movie Summary Contents Curation App  ✨
```
태블릿 기기 전용 앱 입니다. 개발중인 구현물은 테블릿 시뮬레이터로(Ipad 12.9권장) 확인하실 수 있습니다!
```



## 목차
- [개발 동기](#개발-동기)
- [요약](#요약)
- [진행단계](#진행단계)

[//]: # (- [고민한 키워드]&#40;#고민한-키워드&#41;)

[//]: # (- [보완 및 구현 계획]&#40;#보완-및-구현-계획&#41;)

[//]: # (- [구현 결과]&#40;#구현-결과&#41;)


## 개발 동기
<b>“바쁘다, 바빠 현대사회!”</b> <br>
아무리 바쁜 현대인들이라도 영화 콘텐츠를 즐기려 합니다. 하지만 예전처럼 영화관에서 긴 러닝타임의 영화를 보기 보다는 영화의 줄거리를 요약한 짧은 컨텐츠를 소비합니다. 바로 `서머리 콘텐츠(Summary Contents)` 입니다. Youtube에서  ‘영화 리뷰' 또는 ‘영화 요약'이라는 키워드로만 검색해도 쉽게 찾을 수 있죠. 다만 유튜브에서 영화 서머리 컨텐츠를 검색하려고 했을 때 자극적인 썸네일과 제목으로 도배 되어 잇습니다.  양질의 서머리 컨텐츠를 소비하고 싶은 유저들은 어떤것이 재미있는 영화고 아니인지를 판단하기 힘들게 됩니다.
이런 문제를 해결하기 위해 좀 더 양질의 서머리 컨텐츠 검색을 도와주는 `영화 서머리 컨텐츠 큐레이션 플랫폼` 구상하고 개발중에 있습니다.



## 요약

| Index | Detail                                                                                                                                                                                                                              |
|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 기여    | 100% (개발, 기획, 디자인)                                                                                                                                                                                                                  |
| 기술 스택 | - Flutter                                                                                                                                                                                                                           |
| 구현 기능 | - TMDB API를 호출하여 인기 영화, 드라마 등의 컨텐츠 데이터를 Fetch <br/> - Youtube API를 Query값을 넣어 필요한 리뷰 컨텐츠 호출 <br> - LayoutBuilder를 이용하여 Tablet과 Mobile 디바이스마다 각각 다른 위젯(스크린) 호출  <br> - 디바이스 별 필요 Orientation 적용  <br> - 윕뷰를 사용하여 Youtube사이트로 이동 <br> | 



## 진행단계

### 2차
- Clean MVVM 아키텍쳐 적용 (리팩토링)
  - Layered Architecture 개념 적용
  - 각 레이어의 역할과 책임 분리
  - DI(의존성 주입) 개념 적용
  - 각 레이어에 Exception 로직 추가

- 로직 고도화
  - 라우팅 로직 개선(라우팅 시 불필요한 데이터 호출 최소화)
  - Firebase Firestore 적용
    - TMDB API에서 받아온 컨텐츠 데이터가 Firebase DB에 저장되어 있으면 저장되어 있는 정보를 호출하여 기존 TMDB 정보와 매핑 또는 기존 TMDB 데이터 대체
    - 리뷰 컨텐츠를 카테고리화하여 Firebase DB에 저장 (Youtube & TMDB API에 의존하지 않고 개발자가 사용자에게 제공하시고 싶은 컨텐츠를 지정할 수 있도록 함)
    - 코드의 가독성과 심미성에 집중


### 1차 
- 서비스 기획 & 디자인
- MVVM 아키텍쳐 적용
- TMDB + YOUTUBE API를 활용 데이터 호출 로직 구성
- 라우팅 로직 적용 (PagedView Routing)
