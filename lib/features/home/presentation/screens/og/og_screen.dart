import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ndt_app/features/home/domain/domain.dart';
import 'package:animate_do/animate_do.dart';
import 'package:ndt_app/features/shared/shared.dart';
import 'package:shimmer/shimmer.dart';

class OgScreen extends StatefulWidget {
  static const String routeName = 'og';
  final Content data;
  final String index;
  const OgScreen({
    super.key,
    required this.data,
    required this.index,
  });

  @override
  State<OgScreen> createState() => _OgScreenState();
}

class _OgScreenState extends State<OgScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 300), () {
      _isLoading = true;
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: _isLoading
              ? const _Loading()
              : Column(
                  children: [
                    _TitleImage(
                      image:
                          widget.data.images?[int.tryParse(widget.index) ?? 0],
                    ),
                    _Bodyinfo(
                      data: widget.data,
                      index: int.parse(widget.index),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class _TitleImage extends StatelessWidget {
  final String image;
  const _TitleImage({required this.image});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.4,
      width: double.infinity,
      child: Stack(
        children: [
          FadeIn(
            child: image.contains('https')
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      image,
                      height: size.height * 0.4,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      image,
                      height: size.height * 0.4,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const CustomBackgroundGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.1, 0.5],
            ),
          ),
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _Bodyinfo extends StatelessWidget {
  final Content data;
  final int index;
  const _Bodyinfo({
    required this.data,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final textStyleTitle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        );
    final textStyleInformation = Theme.of(context).textTheme.bodyLarge;
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.information!.keys.elementAt(index),
              style: textStyleTitle,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              data.information!.values.elementAt(index),
              style: textStyleInformation,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Shimmer.fromColors(
      baseColor: Colors.grey.withOpacity(0.5),
      highlightColor: Colors.white.withOpacity(0.5),
      child: Column(
        children: [
          BannerPlaceholder(
            height: size.height * 0.5,
          ),
          const SizedBox(height: 16.0),
          TitlePlaceholder(
            width: size.width,
          ),
          const SizedBox(height: 16.0),
          const ContentPlaceholder(lineType: ContentLineType.threeLines),
          const SizedBox(height: 16.0),
          const ContentPlaceholder(lineType: ContentLineType.threeLines),
          const SizedBox(height: 16.0),
          const ContentPlaceholder(lineType: ContentLineType.threeLines),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
