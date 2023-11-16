import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';

/// Copyright 2020 Logica Booleana Authors

// Dependencias
// import 'package:desingapp/src/utils/dynamicTheme_lb.dart';
// import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:flutter/material.dart';

/// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';

// Creamos una lista con la información de los cuerpos del sistema solar
final List usersList = [
  {
    'name': 'juan',
    'image':
        'https://thumbs.dreamstime.com/b/el-blogger-de-selfie-habla-con-los-suscriptores-en-la-playa-mar-las-olas-dan-mano-y-sonr%C3%ADen-159428734.jpg',
  },
  {
    'name': 'maria',
    'image':
        'https://www.hofmann.es/blog/wp-content/uploads/2014/11/selfie-perfecto-600x450.jpg',
  },
  {
    'name': 'julieta',
    'image':
        'https://www.geoado.com/wp-content/uploads/2019/04/GettyImages-1132279159-e1554999053784.jpg',
  },
  {
    'name': 'pancho',
    'image':
        'https://cnnespanol.cnn.com/wp-content/uploads/2015/09/monkey-selfie.jpeg',
  },
];
final List<Map> listaPlanetas = [
  {
    'titulo': "Sol",
    'subtitulo':
        "Es una estrella de tipo-G de la secuencia principal y clase de luminosidad V que se encuentra en el centro del sistema solar y constituye la mayor fuente de radiación electromagnética de este sistema planetario.",
    'assetImage': const AssetImage("assets/image_sol.png"),
    'superficie': '6,0877 × 1012 km²',
    'distancia': '0 km',
    'color': Colors.orange,
  },
  {
    'titulo': "Mercurio",
    'subtitulo':
        "Es el planeta del sistema solar más próximo al Sol y el más pequeño. Forma parte de los denominados planetas interiores o terrestres y carece de satélites naturales al igual que Venus. ",
    'assetImage': const AssetImage("assets/image_planeta_mercurio.png"),
    'superficie': '74,8 millones km²',
    'distancia': ' 57,91 millones km',
    'color': Colors.grey,
  },
  {
    'titulo': "Venus",
    'subtitulo':
        "Es el segundo planeta del sistema solar en orden de distancia desde el Sol, el sexto en cuanto a tamaño, ordenados de mayor a menor. Al igual que Mercurio, carece de satélites naturales. Recibe su nombre en honor a Venus, la diosa romana del amor.",
    'assetImage': const AssetImage("assets/image_planeta_venus.png"),
    'superficie': '460,2 millones km²',
    'distancia': '108,2 millones km',
    'color': Colors.orange[700],
  },
  {
    'titulo': "Tierra",
    'subtitulo':
        "Es un planeta del sistema solar que gira alrededor de su estrella —el Sol— en la tercera órbita más interna. Es el más denso y el quinto mayor de los ocho planetas del sistema solar. También es el mayor de los cuatro terrestres o rocosos.",
    'assetImage': const AssetImage("assets/image_planeta_tierra.png"),
    'superficie': '510,1 millones km²',
    'distancia': '149,6 millones km',
    'color': Colors.blue[800],
  },
  {
    'titulo': "Marte",
    'subtitulo':
        "Es el cuarto planeta en orden de distancia al Sol y el segundo más pequeño del sistema solar, después de Mercurio.",
    'assetImage': const AssetImage("assets/image_planeta_marte.png"),
    'superficie': '144,8 millones km²',
    'distancia': '227,9 millones km',
    'color': Colors.red,
  },
  {
    'titulo': "Júpiter",
    'subtitulo':
        "Es el quinto planeta del sistema solar. Forma parte de los denominados planetas exteriores o gaseosos. Recibe su nombre del dios romano Júpiter. Se trata del planeta que ofrece un mayor brillo a lo largo del año dependiendo de su fase.",
    'assetImage': const AssetImage("assets/image_planeta_jupiter.png"),
    'superficie': '74,8 millones km²',
    'distancia': '61,42 miles de millones km²',
    'color': Colors.yellow[900],
  },
  {
    'titulo': "Saturno",
    'subtitulo':
        "Es el sexto planeta del sistema solar contando desde el Sol, el segundo en tamaño y masa después de Júpiter y el único con un sistema de anillos visible desde la Tierra. Su nombre proviene del dios romano Saturno. Forma parte de los denominados planetas exteriores o gaseosos. ",
    'assetImage': const AssetImage("assets/image_planeta_saturno.png"),
    'superficie': '42,7 miles de millones km²',
    'distancia': '1,434 miles de millones km',
    'color': Colors.orange[200],
  },
  {
    'titulo': "Urano",
    'subtitulo':
        "Es el séptimo planeta del sistema solar, el tercero de mayor tamaño, y el cuarto más masivo. Se llama así en honor de la divinidad griega del cielo Urano, el padre de Crono y el abuelo de Zeus.",
    'assetImage': const AssetImage("assets/image_planeta_urano.png"),
    'superficie': '8,083 miles de millones km²',
    'distancia': '2,871 miles de millones km',
    'color': Colors.cyan,
  },
  {
    'titulo': "Neptuno",
    'subtitulo':
        "Es el octavo planeta en distancia respecto al Sol y el más lejano del sistema solar. Forma parte de los denominados planetas exteriores o gigantes gaseosos, y es el primero que fue descubierto gracias a predicciones matemáticas.",
    'assetImage': const AssetImage("assets/image_planeta_neptuno.png"),
    'superficie': '7,618 miles de millones km²',
    'distancia': '4,495 miles de millones km',
    'color': Colors.blueGrey,
  },
];

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  HomeTestState createState() => HomeTestState();
}

class HomeTestState extends State<HomeTest> {
  // var
  bool themeIsDark = false;
  int positionPlaneta = 0;
  late BoxDecoration boxDecorationFondo;
  Color colorPrimary = Colors.transparent;
  Color colorCardView = Colors.white12;
  Color colorCardViewHorizontal = Colors.white10;
  Color colorTitulo = Colors.white70;
  Color colorTextoCardview = Colors.white30;
  late double scaleFactor;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Definimos las variables
    scaleFactor = MediaQuery.of(context).textScaleFactor;
    themeIsDark =
        Theme.of(context).brightness == Brightness.dark ? true : false;
    boxDecorationFondo = Theme.of(context).brightness == Brightness.dark
        ? const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.black, Colors.black],
          ))
        : const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(88, 71, 151, 1.0),
              Color.fromRGBO(34, 28, 56, 1.0)
            ],
          ));

    return Container(
      decoration: boxDecorationFondo,
      child: Stack(
        children: [
          // background
          ImgGalaxy(
              duration: const Duration(seconds: 3), isFullSun: themeIsDark),
          Scaffold(
            drawer: const Drawer(),
            backgroundColor: Colors.transparent,
            body: body(),
            bottomNavigationBar: bottomNavyBar(context: context),
          ),
        ],
      ),
    );
  }

  /// MAIN WIDGET
  PreferredSizeWidget appbar({required BuildContext context}) {
    return AppBar(
      //  systemOverlayStyle : Especifica el estilo que se usará para las superposiciones del sistema que se superponen con la barra de aplicaciones
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarIconBrightness:
              Theme.of(context).brightness == Brightness.dark
                  ? Brightness.light
                  : Brightness.dark),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: const [
        // WidgetsUtilsApp().buttonThemeBrightness(context: context),
      ],
    );
  }

  Widget body() {
    //  SafeArea : inserta a su hijo con suficiente relleno para evitar intrusiones por parte del sistema operativo. Por ejemplo, esto sangrará al niño lo suficiente como para evitar la barra de estado en la parte superior de la pantalla
    return ListView(
      children: <Widget>[
        appbar(context: context),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: RichText(
            text: const TextSpan(
              text: 'PON TU HUELLA EN LOS\n',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              children: <TextSpan>[
                TextSpan(
                    text: 'VIAJES ESPACIALES!',
                    style: TextStyle(color: Colors.orange)),
              ],
            ),
          ),
        ),
        // button : seach
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: searchButtonWidget),
        // tarjetas de los planetas
        Onboading(
            context: context,
            colorFondo: Colors.transparent,
            listaCuerpos: listaPlanetas),
        const SizedBox(height: 12),
        // avatares de usuarios en línea
        usersComunityWidget,
      ],
    );
  }

  /// WIDGETS COMPONENTS
  Widget get usersComunityWidget {
    //  mostramos 3 avatares y un botón para ir a todos los usuarios en línea

    // values
    double radius = 20.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              // avatar 0
              CircleAvatar(
                  radius: radius,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                      radius: radius - 2,
                      backgroundColor: Colors.grey.shade100,
                      backgroundImage: NetworkImage(usersList[0]['image']))),
              // avatar 1
              Padding(
                padding: EdgeInsets.only(left: radius),
                child: CircleAvatar(
                    radius: radius,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                        radius: radius - 2,
                        backgroundColor: Colors.grey.shade100,
                        backgroundImage: NetworkImage(usersList[1]['image']))),
              ),
              // avatar 2
              Padding(
                padding: const EdgeInsets.only(left: 48),
                child: CircleAvatar(
                    radius: radius,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                        radius: radius - 2,
                        backgroundColor: Colors.grey.shade100,
                        backgroundImage: NetworkImage(usersList[2]['image']))),
              ),
              // button
              Padding(
                padding: const EdgeInsets.only(left: 72),
                child: CircleAvatar(
                    radius: radius,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: radius - 2,
                      backgroundColor: Colors.grey.shade100,
                      child: const Text(
                        '557',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // text
          const Text('juan, joey, carolina y 557 personas mas online',
              style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget bottomNavyBar({required BuildContext context}) {
    // BottomNavyBar : Una navegación inferior hermosa y animada. La barra de navegación utiliza su tema actual, pero puede personalizarlo libremente.
    return BottomNavyBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      selectedIndex: 0,
      onItemSelected: (i) {},
      items: [
        BottomNavyBarItem(
          icon: const Icon(Icons.apps),
          title: const Text('Home'),
          activeColor: Colors.red,
        ),
        BottomNavyBarItem(
            icon: const Icon(Icons.people),
            title: const Text('Users'),
            activeColor: Colors.purpleAccent),
        BottomNavyBarItem(
            icon: const Icon(Icons.message),
            title: const Text('Messages'),
            activeColor: Colors.pink),
        BottomNavyBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('Settings'),
            activeColor: Colors.blue),
      ],
    );
  }

  Widget get searchButtonWidget => Opacity(
      opacity: 0.5,
      child: Card(
          child: ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Buscar planeta"),
              onLongPress: () {})));
}

/// CLASS WIDGETS
class Onboading extends StatefulWidget {
  const Onboading(
      {Key? key,
      required this.context,
      required this.colorFondo,
      required this.listaCuerpos})
      : super(key: key);

  // var
  final BuildContext context;
  final Color colorFondo;
  final List<dynamic> listaCuerpos;

  @override
  OnboadingState createState() => OnboadingState(
      colorFondo: colorFondo, context: context, listaCuerpos: listaCuerpos);
}

class OnboadingState extends State<Onboading> with TickerProviderStateMixin {
  OnboadingState(
      {required this.context,
      required this.colorFondo,
      required this.listaCuerpos});
  // var
  @override
  final BuildContext context;
  final Color colorFondo;
  final List<dynamic> listaCuerpos;
  late AnimationController animateController2;
  int currentSlide = 0;
  late double scaleFactor;
  final double height = 400;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    animateController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Definimos las variables
    scaleFactor = MediaQuery.of(context).textScaleFactor;

    return SizedBox(
      width: double.infinity,
      height: height,
      child: CarouselSlider.builder(
        itemCount: listaPlanetas.length,
        options: CarouselOptions(
            enlargeCenterPage: true,
            height: double.infinity,
            enableInfiniteScroll: true,
            viewportFraction: 0.5,
            initialPage: 0,
            autoPlay: false,
            enlargeStrategy: CenterPageEnlargeStrategy.scale,
            onPageChanged: (index, reason) =>
                setState(() => currentSlide = index)),
        itemBuilder: (context, index, realIndex) {
          // values
          bool focusWidget = currentSlide == index ? true : false;

          // AnimatedOpacity : Versión animada de Opacity que cambia automáticamente la opacidad del niño durante un período determinado cada vez que cambia la opacidad dada.
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 800),
            opacity: focusWidget ? 1.0 : 0.3,
            // Transform.scale : widget que escala su hijo a lo largo del plano 2D
            child: SizedBox(
                //scaleX:focusWidget?1:.8,scaleY:focusWidget?1:.8,
                height: height,
                // card
                child: cardViewPlanetaView(
                    color: listaCuerpos[index]["color"] ?? Colors.red,
                    colorTitulo: Colors.white24,
                    colortexto: Colors.white70,
                    assetImage: const AssetImage('assets/images/onda.png'),
                    titulo: listaCuerpos[index]["titulo"],
                    subtitulo: listaCuerpos[index]["subtitulo"],
                    distancia: listaCuerpos[index]["distancia"],
                    superficie: listaCuerpos[index]["superficie"])),
          );
        },
      ),
    );
  }

  /// WIDGETS COMPONENTS
  Widget cardViewPlanetaView({
    required AssetImage assetImage,
    required String titulo,
    String subtitulo = "",
    String distancia = "",
    String superficie = "",
    Color color = Colors.white10,
    Color colorTitulo = Colors.white10,
    Color colortexto = Colors.white10,
  }) {
    // Devuelve una vista previa de un tarjeta grande con los datos del planeta enfocado */

    // var
    final imagenPlaneta = SpinPerfect(
        // SpinPerfect : animación */
        manualTrigger:
            true, // (opcional) si es verdadero, no disparará la animación al cargar */
        controller: (controller) => animateController2 = controller,
        infinite: true,
        animate: true,
        duration: const Duration(
          seconds: 50,
        ), // (opcional, pero obligatorio si usa manualTrigger: true) Esta devolución de llamada expone el AnimationController utilizado para la animación seleccionada. Luego puede llamar a animationController.forward () para activar la animación donde quiera manualmente. */
        child: Image(
            image: assetImage,
            height: 150.0 * scaleFactor,
            width: 150.0 * scaleFactor));

    // card : Tarjeta con detalles
    final tarjetaDetalles = Container(
        padding: const EdgeInsets.only(
            left: 12.0, top: 20.0, right: 20.0, bottom: 20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.transparent, color]),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: const <BoxShadow>[
            BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: Offset(0.0, 8.0))
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // text : name
            Text(titulo,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: colorTitulo),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis),
            // text : descripción
            const SizedBox(height: 12.0),
            Text(
              subtitulo,
              style: TextStyle(fontSize: 16.0, color: colortexto),
              textAlign: TextAlign.left,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 12.0),
            //  text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.brightness_7, size: 14.0, color: Colors.amber),
                const SizedBox(width: 2.0),
                Expanded(
                    flex: 1,
                    child: Text(distancia,
                        style: TextStyle(fontSize: 12.0, color: colortexto),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1)),
              ],
            ),
            const SizedBox(height: 5.0),
            //  text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.transfer_within_a_station,
                    size: 14.0, color: Colors.blueAccent),
                const SizedBox(width: 2.0),
                Expanded(
                    flex: 1,
                    child: Text(
                      superficie,
                      style: TextStyle(fontSize: 12.0, color: colortexto),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ],
            ),
          ],
        ));
    // Creamos una vista superpuesta
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Column(
          children: [
            //  SizedBox : dejamos un espacio reservado
            SizedBox(width: double.infinity, height: 125 * scaleFactor),
            tarjetaDetalles,
          ],
        ),
        imagenPlaneta,
      ],
    );
  }
}

class ImgGalaxy extends StatelessWidget {
  const ImgGalaxy({
    Key? key,
    required Duration duration,
    required this.isFullSun,
  })  : _duration = duration,
        super(key: key);

  // var
  final Duration _duration;
  final bool isFullSun;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        opacity: 0.8,
        duration: _duration,
        curve: Curves.easeOut,
        child: Image.asset("assets/images/onda.png",
            gaplessPlayback: true, fit: BoxFit.fitHeight));
  }
}
