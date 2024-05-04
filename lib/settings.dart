import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 188, 31, 7),
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      backgroundColor: const Color(0xfff6f6f6),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ListView(
            children: [
              _SingleSection(
                title: "General",
                children: [
                  const _CustomListTile(
                      title: "About Phone",
                      icon: CupertinoIcons.device_phone_portrait),
                  _CustomListTile(
                      title: "Dark Mode",
                      icon: CupertinoIcons.moon,
                      trailing:
                      CupertinoSwitch(value: true, onChanged: (value) {})),
                ],
              ),
              _SingleSection(
                title: "Network",
                children: [
                  _CustomListTile(
                    title: "Wi-Fi",
                    icon: CupertinoIcons.wifi,
                    trailing: CupertinoSwitch(value: true, onChanged: (val) {}),
                  ),
                ],
              ),
              const _SingleSection(
                title: "Privacy and Security",
                children: [
                  _CustomListTile(
                      title: "Display", icon: CupertinoIcons.brightness),
                  _CustomListTile(
                      title: "Sound and Vibration",
                      icon: CupertinoIcons.speaker_2),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing ?? const Icon(CupertinoIcons.forward, size: 18),
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 16),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: children,
          ),
        ),
      ],
    );
  }
}
