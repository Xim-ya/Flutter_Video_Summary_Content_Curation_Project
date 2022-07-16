class FirebaseTemp {
  static final List<RegisteredContent> registerContentList = [
    RegisteredContent(
      title: '닥터 스트레인지',
      contentId: 453395,
      youtubeVideIdList: ['TaUgXoYjY4U', 'PlAIolfdhW0', 'AQ7reWRisqU'],
    ),
    RegisteredContent(
      title: '탑건 2 메버릭',
      contentId: 361743,
      youtubeVideIdList: ['TaUgXoYjY4U', 'PlAIolfdhW0', 'AQ7reWRisqU'],
    ),
  ];
}

// Firebase에 집어넣을 컨텐츠 모델 객체
class RegisteredContent {
  final String title;
  final int contentId;
  final List<String> youtubeVideIdList;

  RegisteredContent(
      {required this.title,
      required this.contentId,
      required this.youtubeVideIdList});
}
