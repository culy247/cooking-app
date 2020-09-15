import 'package:url_launcher/url_launcher.dart';

void sendEmail() async {
  const url = 'mailto:huyphuc0906@gmail.com?subject=Cookbook support!';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
