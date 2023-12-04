import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:go_router/go_router.dart';
import 'package:ndt_app/features/home/domain/domain.dart';
import 'package:ndt_app/features/home/presentation/providers/providers.dart';
import 'package:ndt_app/features/home/presentation/screens/screens.dart';
import 'package:ndt_app/features/home/presentation/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

class OgInfoScreen extends StatelessWidget {
  final Content data;
  static const routeName = 'ogInfo';
  const OgInfoScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(data.title),
        leading: const AppBarIcon(),
      ),
      body: _OgBody(data: data),
      floatingActionButton: _PlayButton(data: data),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
    );
  }
}

class _PlayButton extends ConsumerWidget {
  final Content data;
  const _PlayButton({
    required this.data,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return ElevatedButton.icon(
      onPressed: () {
        ref.read(ogIndexProvider.notifier).update((state) => state = 0);
        context.pushNamed(
          OgScreen.routeName,
          extra: data,
        );
      },
      icon: Icon(
        Icons.play_arrow,
        color: colors.onBackground,
      ),
      label: Text(
        'Comenzar Lecturas',
        style: textStyle.bodyLarge!.copyWith(
          fontWeight: FontWeight.bold,
          color: colors.onBackground,
        ),
      ),
    );
  }
}

class _OgBody extends StatefulWidget {
  const _OgBody({
    required this.data,
  });

  final Content data;

  @override
  State<_OgBody> createState() => _OgBodyState();
}

class _OgBodyState extends State<_OgBody> {
  bool _isLoading = true;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _isLoading = true;
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const OgBackGround(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: _isLoading
              ? _Loading(data: widget.data)
              : SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      _Title(data: widget.data),
                      _Cards(data: widget.data),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}

class _Cards extends ConsumerWidget {
  const _Cards({
    required this.data,
  });

  final Content data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimationLimiter(
      child: SizedBox(
        height: size.height * 0.75,
        width: double.infinity,
        child: ListView.builder(
          itemBuilder: (context, index) {
            final title = data.information!.keys.elementAt(index);
            final description = data.information!.values.elementAt(index);
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 1,
              child: SlideAnimation(
                verticalOffset: 100.0,
                child: FadeInAnimation(
                  child: Opacity(
                    opacity: 1 - (index * 0.05),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      surfaceTintColor:
                          isDark ? colors.onBackground : Colors.transparent,
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 5),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        visualDensity: VisualDensity.compact,
                        onTap: () {
                          ref
                              .read(ogIndexProvider.notifier)
                              .update((state) => state = index);
                          context.pushNamed(
                            OgScreen.routeName,
                            extra: data,
                          );
                        },
                        leading: Container(
                          height: 100,
                          width: 50,
                          decoration: BoxDecoration(
                            color: colors.surface,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: isDark
                                ? null
                                : [
                                    BoxShadow(
                                      color: colors.onSurface.withOpacity(0.5),
                                      blurRadius: 5,
                                      offset: const Offset(0, 5),
                                    ),
                                  ],
                          ),
                          child: Center(
                            child: Text(
                              '0${index + 1}',
                              style: Theme.of(context).textTheme.headlineMedium,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        title: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                color: colors.onBackground,
                                fontSize: 21,
                              ),
                        ),
                        subtitle: Text(
                          description,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: colors.onBackground.withOpacity(0.6),
                                  ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: data.information?.length ?? 0,
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.data,
  });

  final Content data;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: isDark ? null : colors.primary.withOpacity(0.8),
          fontSize: 25,
          shadows: isDark
              ? [
                  BoxShadow(
                    color: colors.onBackground.withOpacity(0.2),
                    blurRadius: 2,
                    offset: const Offset(1, 1),
                  ),
                ]
              : null,
        );
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        data.description,
        style: textStyle,
        textAlign: TextAlign.left,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }
}

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.close),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}

class _Loading extends StatelessWidget {
  final Content data;
  const _Loading({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.white.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _Title(data: data),
            _Cards(data: data),
          ],
        ),
      ),
    );
  }
}
