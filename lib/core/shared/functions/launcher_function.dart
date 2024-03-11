import 'package:url_launcher/url_launcher.dart';

Future<void> launchInBrowser(String url) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
  )) {
    throw Exception('Could not launch $url');
  }
}
