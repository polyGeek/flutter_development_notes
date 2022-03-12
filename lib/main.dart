import 'package:flutter/material.dart';

void main() {
	runApp(  MyApp( key: UniqueKey(),) );
}

class MyApp extends StatelessWidget {
	const MyApp({ required Key key}) : super( key: key );

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			darkTheme: ThemeData(
				brightness: Brightness.dark,
			),
			themeMode: ThemeMode.dark,
			debugShowCheckedModeBanner: false,
			home: MyHomePage( key: UniqueKey() ),
		);
	}
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({required Key key}) : super( key: key );

	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

	@override
	Widget build( BuildContext context ) {
		return Scaffold(
			appBar: AppBar(
				title: const Text( 'Development Test' ),
				centerTitle: true,
			),
			body: Padding( padding: const EdgeInsets.all(8.0),
				child: SingleChildScrollView(

					child: Column(
						crossAxisAlignment: CrossAxisAlignment.stretch,

						children: const [

							Text( "Heading",
								textAlign: TextAlign.center,
							),

							SizedBox( height: 20 ,),

						],
					),
				),
			),
		);
	}
}
