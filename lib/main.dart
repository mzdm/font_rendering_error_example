import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  final fontsList = <String>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Test')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 'fonts' or 'localFonts'
            for (final it in List.generate(12, (_) => 0))
              fontsList.addAll(fonts.split('\n'));

            Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => FontsPage(fontsList: fontsList),
            ));
          },
          child: Text('Next Page'),
        ),
      ),
    );
  }
}

class FontsPage extends StatelessWidget {
  const FontsPage({
    Key key,
    @required this.fontsList,
  }) : super(key: key);

  final List<String> fontsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView.separated(
          itemCount: fontsList.length,
          separatorBuilder: (_, __) => Divider(height: 40.0),
          itemBuilder: (_, index) {
            final isEven = index % 2 == 0;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                isEven ? 'přížíéščé č' : '订单, asdf',
                // if using 'localFonts' uncomment this:
                // style: TextStyle(
                //   fontFamily: fontsList[index],
                //   fontSize: 58.0,
                // ),
                style: GoogleFonts.getFont(fontsList[index]).copyWith(
                  fontSize: 58,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Google Fonts
const fonts = """
Ubuntu
Titillium Web
Stalinist One
Source Sans Pro
Source Code Pro
Roboto Condensed
Roboto
PT Serif
PT Sans Narrow
PT Sans
Poppins
Oxygen
Open Sans
Nunito Sans
Nunito
Noto Serif
Noto Sans
Nanum Gothic
Mukta
Montserrat
Merriweather
Lobster
Libre Baskerville
Lexend Mega
Lexend Giga
Lato
Jomhuria
IBM Plex Sans
Hind Siliguri
Hanalei
Hammersmith One
Fjalla One
Fira Sans
Crimson Text
Big Shoulders Display
Bebas Neue
Barlow
Anton
Abel""";

// load fonts from assets without GoogleFonts lib
const localFonts = """
Ubuntu
TitilliumWeb
StalinistOne
SourceSansPro
SourceCodePro
Slabo27px
RobotoCondensed
Roboto
PTSerif
PTSansNarrow
PTSans
Poppins
Oxygen
OpenSans
NunitoSans
Nunito
NotoSerif
NotoSans
NanumGothic
Mukta
Montserrat
Merriweather
Lobster
LibreBaskerville
LexendMega
LexendGiga
Lato
Jomhuria
IBMPlexSans
HindSiliguri
Hanalei
HammersmithOne
FjallaOne
FiraSans
CrimsonText
BigShouldersDisplay
Benne
BebasNeue
Barlow
Anton
Abel
""";
