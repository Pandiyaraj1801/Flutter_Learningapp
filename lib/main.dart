import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/network/dio/screens/dio_screen.dart';
import 'package:learnapp/network/http/screens/http_screen.dart';
import 'package:learnapp/statemanagement/blocs/bloc/api/methods/bloc.dart';
import 'package:learnapp/statemanagement/blocs/bloc/api/screens/apibloc_screen.dart';
import 'package:learnapp/statemanagement/blocs/bloc/counter/methods/counter_bloc.dart';
import 'package:learnapp/statemanagement/blocs/bloc/counter/screens/counterbloc_screen.dart';
import 'package:learnapp/statemanagement/blocs/cubit/api/methods/api_cubit.dart';
import 'package:learnapp/statemanagement/blocs/cubit/api/screens/apicubit_screen.dart';
import 'package:learnapp/statemanagement/blocs/cubit/counter/methods/counter_cubit.dart';
import 'package:learnapp/statemanagement/blocs/cubit/counter/screens/counter_screen.dart';
import 'package:learnapp/statemanagement/getx/api/screens.dart';
import 'package:learnapp/statemanagement/getx/counter/screen.dart';
import 'package:learnapp/statemanagement/providers/methods/api_provider.dart';
import 'package:learnapp/statemanagement/providers/methods/counter_provider.dart';
import 'package:learnapp/statemanagement/providers/screens/api_screen.dart';
import 'package:learnapp/statemanagement/providers/screens/counter_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ApiCubit()),
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => ApiBloc()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          ChangeNotifierProvider(create: (context) => ApiProvider()),
        ],
        child: MaterialApp(
          // home: HttpScreen(),
          // home: DioScreen(),
          // home: CounterScreen(),
          // home: ApiProviderScreen(),
          // home: CounterCubitScreen(),
          // home: ApiCubitScreen(),
          // home: CounterBlocScreen(),
          // home: ApiBlocScreen(),
          // home: CounterGetxScreen(),
          home: ApiGetxScreen(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
