import 'package:lanars_test/data/source/remote/api/feed_api/feed_api.dart';
import 'package:lanars_test/domain/models/curated_photo.dart';

class FeedRepository {
  FeedRepository(this._feedApi);

  final FeedApi _feedApi;

  ///Method used for getting a list of curated photos from API.
  ///Turns data from a data transfer object to a regular model when getting a
  ///response.
  Future<List<CuratedPhoto>> getCuratedPhotosList() async {
    final photosList = await _feedApi.getCuratedPhotosList();
    final list = <CuratedPhoto>[];

    for(var i = 0; i < photosList.length; i++) {
      final photo = photosList[i].toCuratedPhoto();

      list.add(photo);
    }

    return list;
  }
}
