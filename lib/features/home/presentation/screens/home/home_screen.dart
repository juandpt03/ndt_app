import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ndt_app/features/home/domain/domain.dart';
import 'package:ndt_app/features/home/presentation/providers/providers.dart';
import 'package:ndt_app/features/home/presentation/widgets/widgets.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final isDark = ref.watch(themeProvider).isDark;
    final boxDecoration = isDark
        ? BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colors.primary.withOpacity(0.3),
                colors.background,
              ],
            ),
          )
        : BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                colors.primary,
                colors.primary.withOpacity(0.8),
              ],
            ),
          );

    return Container(
      decoration: boxDecoration,
      child: Stack(
        children: [
          // background
          const HomeBackground(),
          Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: const Text(
                'Ondas Guiadas',
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
              ],
            ),
            drawer: const CustomDrawer(),
            backgroundColor: Colors.transparent,
            body: _HomeBody(),
            bottomNavigationBar: const CustomBottomNavigationBar(
              currentIndex: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        _HomeTitle(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: SearchButtom(),
        ),
        InfoCards()
      ],
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
          text: 'INSPECCIÓN AVANZADA\n',
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
                ))
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
              color: colors.background,
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

class SearchButtom extends StatelessWidget {
  const SearchButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Opacity(
      opacity: 0.8,
      child: Card(
        color: Colors.white30,
        child: ListTile(
            leading: Icon(
              Icons.search,
              color: colors.background,
            ),
            title: Text(
              "Buscar tema",
              style: TextStyle(
                color: colors.background,
              ),
            ),
            onLongPress: () {}),
      ),
    );
  }
}

class InfoCards extends ConsumerWidget {
  const InfoCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(randomColorProvider);
    return ref.watch(dataProvider).when(
          data: (dataList) {
            return SizedBox(
              height: 400,
              width: double.infinity,
              child: CarouselSlider.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index, realIndex) {
                  final data = dataList[index];

                  return _Cards(data: data, color: color[index]);
                },
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.6,
                ),
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

class _Cards extends StatelessWidget {
  final Color color;
  const _Cards({
    required this.data,
    required this.color,
  });

  final Content data;

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    return Container(
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
          colors: [Colors.transparent, color],
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
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
    );
  }
}
