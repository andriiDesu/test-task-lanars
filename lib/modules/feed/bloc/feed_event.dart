part of 'feed_bloc.dart';

class FeedEvent extends BaseEvent {}

class GetPhotosEvent extends FeedEvent {}

class UpdatePhotosEvent extends FeedEvent {
  UpdatePhotosEvent({
    required this.curatedPhotos,
  });

  final List<CuratedPhoto> curatedPhotos;
}
