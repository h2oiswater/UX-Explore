abstract class IConversationBloc {
  void startRecord();
  void stopRecord();
  void startPlayer();
  void stopPlayer();

  void getLatestText();
}