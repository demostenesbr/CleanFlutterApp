import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:meta/meta.dart';

import '../entities/entities.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;

  RemoteAuthentication({
    @required this.httpClient,
    @required this.url,
  });

  Future<void> auth() async {}
}

abstract class HttpClient {
  Future<void> request({@required String url});
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('Should call HttpClient with current URL', () async{
    final httpClient = HttpClient();
    final url = faker.internet.httpUrl();
    final sut = RemoteAuthentication(httpClient: httpClient, url: url);

    await sut.auth();

    verify(httpClient.requrest(url: url));
  });
}