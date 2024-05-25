import 'package:pure_life/core/exceptions/invalid_link_exception.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(String link) async {
  final url = Uri.parse(link);
  if (!await launchUrl(url)) {
    throw InvalidLinkException(link);
  }
}
