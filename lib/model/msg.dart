enum MsgDirection {
  OUT,
  IN
}
class Msg {
  String id;
  String content;
  MsgDirection direction;

  Msg({this.id, this.content, this.direction});
}