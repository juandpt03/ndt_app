import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ndt_app/features/home/domain/domain.dart';
import 'package:ndt_app/features/home/presentation/widgets/widgets.dart';

class OgScreen extends StatelessWidget {
  final Content data;
  static const routeName = 'og';
  const OgScreen({
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
      floatingActionButton: const _PlayButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}

class _PlayButton extends StatelessWidget {
  const _PlayButton();

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return ElevatedButton.icon(
      onPressed: () {},
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

class _OgBody extends StatelessWidget {
  const _OgBody({
    required this.data,
  });

  final Content data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const OgBackGround(),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _Title(data: data),
                _Cards(data: data),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _Cards extends StatelessWidget {
  const _Cards({
    required this.data,
  });

  final Content data;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final Size size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return AnimationLimiter(
      child: SizedBox(
        height: size.height,
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
                    opacity: 1 - (index * 0.1),
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
                        visualDensity: VisualDensity.compact,
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
                                color: colors.onBackground.withOpacity(0.8),
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
    final textStyle = Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontWeight: FontWeight.bold,
          color: colors.onBackground.withOpacity(0.8),
        );
    return Text(
      data.description,
      style: textStyle,
      textAlign: TextAlign.left,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
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
