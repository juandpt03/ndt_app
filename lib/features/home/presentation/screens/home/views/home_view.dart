import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndt_app/features/home/domain/domain.dart';
import 'package:ndt_app/features/home/presentation/providers/providers.dart';
import 'package:ndt_app/features/home/presentation/screens/screens.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(themeProvider).isDark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const SizedBox(),
        iconTheme: const IconThemeData(
          color: Colors.white70,
        ),
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
              color: Colors.white70,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).toggleDarkMode();
            },
          ),
        ],
      ),
      // drawer: const CustomDrawer(),
      backgroundColor: Colors.transparent,
      body: _HomeBody(),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _HomeTitle(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: SearchButtom(),
          ),
          InfoCards()
        ],
      ),
    );
  }
}

class _HomeTitle extends StatelessWidget {
  const _HomeTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: RichText(
        text: TextSpan(
          text: 'Inspección Avanzada\n',
          style: TextStyle(
            fontSize: 25,
            fontFamily: GoogleFonts.openSans().fontFamily,
            fontWeight: FontWeight.bold,
            shadows: const [
              Shadow(
                blurRadius: 1.0,
                color: Colors.black38,
                offset: Offset(3.0, 3.0),
              ),
            ],
            color: Colors.white,
          ),
          children: <TextSpan>[
            TextSpan(
              text: '¡ONDAS GUIADAS!',
              style: TextStyle(
                fontFamily: GoogleFonts.openSans().fontFamily,
                color: Colors.orangeAccent,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: colors.surface,
            ),
            child: const Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {},
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class SearchButtom extends ConsumerWidget {
  const SearchButtom({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      child: Opacity(
        opacity: 0.8,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white30,
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: const Icon(
              Icons.search,
              color: Colors.white70,
            ),
            title: const Text(
              "Comienza a Investigar",
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            onTap: () {
              ref.read(navigationBarProvider.notifier).state = 3;
            },
          ),
        ),
      ),
    );
  }
}

class InfoCards extends ConsumerStatefulWidget {
  const InfoCards({super.key});

  @override
  ConsumerState<InfoCards> createState() => _InfoCardsState();
}

class _InfoCardsState extends ConsumerState<InfoCards>
    with TickerProviderStateMixin {
  int currentSlide = 0;
  late AnimationController animateController;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final color = ref.watch(randomColorProvider);
    return ref.watch(dataProvider).when(
          data: (dataList) {
            return CarouselSlider.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index, realIndex) {
                final data = dataList[index];
                bool focusWidget = currentSlide == index ? true : false;

                return GestureDetector(
                  onTap: () {
                    context.pushNamed(
                      OgInfoScreen.routeName,
                      extra: data,
                    );
                  },
                  child: _Card(
                    data: data,
                    color: color[index],
                    focusWidget: focusWidget,
                  ),
                );
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.55,
                onPageChanged: (index, reason) {
                  currentSlide = index;
                  setState(() {});
                },
                autoPlay: true,
                height: size.height * 0.6,
              ),
            );
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const Center(
            child: CircularProgressIndicator(
              color: Colors.white54,
            ),
          ),
        );
  }
}

class _Card extends ConsumerWidget {
  final Color color;
  final bool focusWidget;
  const _Card({
    required this.data,
    required this.color,
    required this.focusWidget,
  });

  final Content data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final isDark = ref.watch(themeProvider).isDark;
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: focusWidget ? 1 : 0.2,
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                width: double.infinity,
                height: 130,
              ),
              Container(
                height: 200,
                padding: const EdgeInsets.only(
                  left: 12.0,
                  top: 20.0,
                  right: 20.0,
                  bottom: 20.0,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      isDark
                          ? colors.primaryContainer.withOpacity(0.1)
                          : colors.primary,
                      color,
                    ],
                  ),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: isDark
                      ? null
                      : const <BoxShadow>[
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 10.0,
                            offset: Offset(0.0, 8.0),
                          )
                        ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    // text : name
                    Text(
                      data.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                    // text : descripción
                    const SizedBox(height: 12.0),
                    Text(
                      data.description,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.white54,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Image.asset(
            data.image,
            height: 150,
            width: 150,
          ),
        ],
      ),
    );
  }
}
