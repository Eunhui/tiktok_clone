import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:threads/constants/gaps.dart';
import 'package:threads/constants/sizes.dart';
import 'package:threads/features/utils.dart';
import 'package:threads/features/view_models/darkmode_config_vm.dart';

class ReportingThread extends ConsumerWidget {
  const ReportingThread({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isdark = ref.watch(darkmodeConfigProvider).isdark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("Report"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                color: Colors.black12,
                height: 20,
              ),
              Text(
                "Why are you reporting this post?",
                style: TextStyle(
                  fontSize: Sizes.size18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Your report is anonymous, except if you're reporting an\nintellectual property infringement. If someone is in \nimmediate danger, call the local emergency services - \ndon't wait.",
                style: TextStyle(
                  color: isdark ? Colors.white60 : Colors.black54,
                ),
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("it's spam"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nudity or sexual acitvity"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hate speech or symbols"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Hate speech or symbols"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Violence or dangerous organizations"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Sale of illegal or regulated goods"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Bullying or harassment"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Intellectual property vilolation"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Suicide or self-injury"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
              dividerMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Eating disorders"),
                  Icon(Icons.arrow_forward_ios, color: Colors.black54),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class dividerMenu extends StatelessWidget {
  const dividerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 30,
      thickness: 1,
      indent: 0,
    );
  }
}
