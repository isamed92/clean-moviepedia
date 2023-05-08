import 'package:moviepidea/domain/entities/entities.dart';
import 'package:moviepidea/infrastructure/models/models.dart';

class VideoMapper {
  static Video videoToEntity(VideoResult video) => Video(
      id: video.id,
      name: video.name,
      publishedAt: video.publishedAt,
      youtubeKey: video.key);
}
