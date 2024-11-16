import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:morfeo/widgets/main_app_bar.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  static const defaultDuration = 10;
  bool waitForLightSleep = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFormField(
              initialValue: defaultDuration.toString(),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: const InputDecoration(
                labelText: 'NAP DURATION',
                suffixText: 'Minutes',
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                setState(() {
                  waitForLightSleep = !waitForLightSleep;
                });
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'WAITS FOR ',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontWeight: FontWeight.w300,
                          fontSize: 16,
                        ),
                        children: [
                          TextSpan(
                            text: 'LIGHT',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const TextSpan(text: ' SLEEP'),
                        ],
                      ),
                    ),
                    Checkbox(
                      value: waitForLightSleep,
                      onChanged: (bool? value) {
                        setState(() {
                          waitForLightSleep = !waitForLightSleep;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'START!',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ),
            ),
            const Expanded(
              child: SizedBox.shrink(),
            ),
            Card(
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  '⚠️ CONNECT YOUR SMART BAND TO Google Health Connect / Apple Health BEFORE TO PROCEED!',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
