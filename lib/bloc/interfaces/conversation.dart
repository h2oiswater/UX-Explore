abstract class IConversationBloc {
  void startRecord();
  void stopRecord();
  void startPlayer(String path);
  void stopPlayer();

  void getLatestText();
}

abstract class IConversationView {
}