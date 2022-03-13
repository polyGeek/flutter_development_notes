import 'dart:math';

import 'package:flutter/material.dart';

enum BodyStates {
  busy,
  home,
  success,
  error,
}


class Home extends StatelessWidget {

  final void Function( BodyStates ) callback;

  const Home( this.callback );

  @override
  Widget build( BuildContext context ) {
    return SizedBox(
      width: 250,
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          const Text( 'This is the home screen'),

          const SizedBox( height: 20,),

          ElevatedButton(
              onPressed: (){

                callback( BodyStates.busy );

                /// This simulates an await call to an API
                Future.delayed( const Duration( milliseconds: 2000 ), () {
                  callback( BodyStates.success );
                } );
              },
              child: const Text(
                'SUBMIT: Success',
                textAlign: TextAlign.center,
              )
          ),

          const SizedBox( height: 20,),

          ElevatedButton(
              onPressed: (){

                callback( BodyStates.busy );

                /// This simulates an await call to an API
                Future.delayed( const Duration( milliseconds: 2000 ), () {
                  callback( BodyStates.error );
                } );
              },
              child: const Text(
                'SUBMIT: Error',
                textAlign: TextAlign.center,
              )
          ),

        ],
      ),
    );
  }
}

class Busy extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return const Center(
        child: CircularProgressIndicator()
    );
  }
}

class ErrorMsg extends StatelessWidget {
  final void Function( BodyStates ) callback;

  ErrorMsg( this.callback );

  @override
  Widget build( BuildContext context ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text( 'There was an error'),

        const SizedBox( height: 20,),

        ElevatedButton(
            onPressed: (){
              callback( BodyStates.busy );

              Future.delayed( const Duration( milliseconds: 2000 ), () {
                callback( BodyStates.success );
              } );
            },
            child: const Text(
              'Try Again: Success',
              textAlign: TextAlign.center,
            )
        ),

        const SizedBox( height: 20,),

        ElevatedButton(
            onPressed: (){
              callback( BodyStates.busy );

              Future.delayed( const Duration( milliseconds: 2000 ), () {
                callback( BodyStates.error );
              } );
            },
            child: const Text(
              'Try Again: Error',
              textAlign: TextAlign.center,
            )
        ),

        const SizedBox( height: 20,),

        ElevatedButton(
            onPressed: (){
              callback( BodyStates.home );
            },
            child: const Text(
              'Return to home',
              textAlign: TextAlign.center,
            )
        ),
      ],
    );
  }
}


class SuccessMsg extends StatelessWidget {

  final void Function( BodyStates ) callback;

  SuccessMsg( this.callback );

  @override
  Widget build( BuildContext context ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        const Text( 'success' ),

        ElevatedButton(
            onPressed: (){
              callback( BodyStates.home );
        	},
        	child: const Text(
        	    'Return Home',
        	    textAlign: TextAlign.center,
            )
        ),
      ],
    );
  }
}
