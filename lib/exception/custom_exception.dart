class CustomException implements Exception {
  final String page;
  final String message;

  CustomException(this.page, [this.message = "지원하지 않는 기능입니다 ! 다시 시도해 주세요 .."]);
}
