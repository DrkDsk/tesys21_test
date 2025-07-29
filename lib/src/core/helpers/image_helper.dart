class ImageHelper {
  static String? extractIdFromUrl(String? url) {

    if (url == null) {
      return null;
    }

    final uri = Uri.parse(url);
    final segments = uri.pathSegments;
    return segments[segments.length - 2];
  }
}