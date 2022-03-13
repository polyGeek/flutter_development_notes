import 'package:development_test/state_views.dart';
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

	Widget _body = Container();

	@override
	void initState() {
		super.initState();

		_body = Home( callback, );
	}


	void callback( BodyStates bodyStates ) {

		switch( bodyStates ) {
			case BodyStates.home:
				_body = Home( callback );
				break;
			case BodyStates.busy:
				_body = Busy();
				break;
			case BodyStates.error:
				_body = ErrorMsg( callback );
				break;
			case BodyStates.success:
				_body = SuccessMsg( callback );
				break;
		}

		_update();
	}

	void _update() {
		if( mounted )
			setState(() {});
	}

	@override
	Widget build( BuildContext context ) {
		return Scaffold(
			appBar: AppBar(
				title: const Text( 'Development Test' ),
				centerTitle: true,
			),
			body: Center(
					child: _body
			),
		);
	}
}
