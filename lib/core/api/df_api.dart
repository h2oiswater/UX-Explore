import 'package:starter/core/api/base/ihttp_client.dart';
import 'package:starter/core/api/base/option.dart';
import 'package:starter/core/bussiness/conversation.dart';
import 'package:starter/core/bussiness/interfaces/IConversationRepository.dart';
import 'config.dart';

class DFAPI {
  IConversationRepository conversationRepository;

  DFAPI() {
    conversationRepository = ConversationRepository(this);
  }

  IHttpClient _client = HttpClient();

  Future<dynamic> request(RequestOption option) {
    option.url = _getUrl(option.url);
    return _client.request(option);
  }

  _getUrl(String url) => BASE_URL + url;
}
