import 'package:lanars_test/data/model/remote/curated_photo_dto.dart';
import 'package:lanars_test/data/source/remote/api/feed_api/feed_network_service.dart';
import 'package:lanars_test/data/source/remote/api/network_service.dart';

class FeedApi {
  FeedApi(this._feedNetworkService);

  final FeedNetworkService _feedNetworkService;
  static const _getCuratedPhotosPath = 'curated';

  static const _curatedPhotosListQuery = {
    'per_page': 50,
  };

  static const _curatedPhotosKey = 'photos';

  ///Method used to get a list of [CuratedPhotoDto] from API. It's possible to
  ///assign query parameters headers if needed.
  ///Authorization is handled by an interceptor inside the network service.
  Future<List<CuratedPhotoDto>> getCuratedPhotosList() async {
    return await _feedNetworkService.request<List<CuratedPhotoDto>>(
      _getCuratedPhotosPath,
      HttpMethod.get,
      queryParameters: _curatedPhotosListQuery,
      onParse: (response) {
        final photos = response.data[_curatedPhotosKey] as List<dynamic>;
        final list = <CuratedPhotoDto>[];

        for(var i = 0; i < photos.length; i++) {
          final photo = CuratedPhotoDto.fromJson(photos[i]);

          list.add(photo);
        }

        return list;
      },
    );
  }
}
