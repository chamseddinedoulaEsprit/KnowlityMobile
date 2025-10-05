// Web implementation of WebHelper
import 'dart:html' as html;
import 'dart:typed_data';

class WebHelper {
  static void downloadBytesAsFile(List<int> bytes, String filename) {
    final blob = html.Blob([Uint8List.fromList(bytes)]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', filename)
      ..click();
    html.Url.revokeObjectUrl(url);
  }
}
