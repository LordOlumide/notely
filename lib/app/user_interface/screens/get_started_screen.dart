import 'package:flutter/material.dart';
import 'package:notely/app/model/onboarding_model.dart';
import 'package:notely/rsc/utils/margins/y_margin.dart';
import 'package:notely/app/user_interface/widgets/notely_button.dart';
import 'create_account_screen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key? key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  late ValueNotifier<int> _currentPageNotifier;

  @override
  void initState() {
    super.initState();
    _currentPageNotifier = ValueNotifier(0);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onboardingList = OnboardingModel.onboardingList;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const YMargin(16),
              const Text(
                'Notely',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF403B36),
                  fontFamily: 'Titan One',
                  fontWeight: FontWeight.w400,
                ),
              ),
              const YMargin(45),
              Expanded(
                child: PageView.builder(
                  onPageChanged: (pageIndex) {
                    _currentPageNotifier.value = pageIndex;
                  },
                  itemCount: onboardingList.length,
                  itemBuilder: (_, index) {
                    final onboardingItem = onboardingList[index];
                    return Column(
                      children: [
                        Image.asset(
                          onboardingItem.image,
                          height: 197,
                        ),
                        const YMargin(28),
                        Text(
                          onboardingItem.title,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF403B36),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const YMargin(12),
                        Text(
                          onboardingItem.description,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF595550),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const YMargin(23),
              ValueListenableBuilder(
                valueListenable: _currentPageNotifier,
                builder: (_, int pageIndex, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: onboardingList.map(
                      (onboarding) {
                        final selected = onboarding.index == pageIndex;
                        return Container(
                          height: selected ? 10 : 8,
                          width: selected ? 15 : 8,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: selected
                                ? theme.colorScheme.secondary
                                : theme.colorScheme.secondary.withOpacity(0.5),
                            borderRadius:
                                BorderRadius.circular(selected ? 5 : 3),
                          ),
                        );
                      },
                    ).toList(),
                  );
                },
              ),
              const YMargin(55),
              NotelyButton(
                text: 'Get Started',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => const CreateAccountScreen()));
                },
              ),
              const YMargin(20),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFFD9614C),
                  ),
                ),
              ),
              const YMargin(25),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _currentPageNotifier.dispose();
    super.dispose();
  }
}
