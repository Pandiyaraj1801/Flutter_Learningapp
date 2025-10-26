import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/data/datasource/api_datasource.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/data/repo_impl/api_repo_impl.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/domain/usecase/api_usecase.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/presentation/bloc/bloc.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/presentation/bloc/event.dart';
import 'package:learnapp/design_patterns/clean_architecture/api/features/presentation/screens/api_screen.dart';
import 'package:learnapp/design_patterns/mvc/api/cubit/model/mvccubit_model.dart';
import 'package:learnapp/design_patterns/mvc/api/cubit/model/mvccubit_model.dart';
import 'package:learnapp/design_patterns/mvc/api/cubit/view/mvccubit_view.dart';
import 'package:learnapp/design_patterns/mvc/api/getx/view/getapi_view.dart';
import 'package:learnapp/design_patterns/mvc/api/provider/model/providerapi_model.dart';
import 'package:learnapp/design_patterns/mvc/api/provider/view/providerapi_view.dart';
import 'package:learnapp/design_patterns/mvc/api/setstate/view/apistate_view.dart';
import 'package:learnapp/design_patterns/mvc/counter/cubit/model/cubit_model.dart';
import 'package:learnapp/design_patterns/mvc/counter/cubit/view/cubit_view.dart';
import 'package:learnapp/design_patterns/mvc/counter/getx/view/get_view.dart';
import 'package:learnapp/design_patterns/mvc/counter/provider/model/provider_model.dart';
import 'package:learnapp/design_patterns/mvc/counter/provider/view/provider_view.dart';
import 'package:learnapp/design_patterns/mvc/counter/setstate/view/counter_setstate.dart';
import 'package:learnapp/design_patterns/mvvm/counter/cubit/mvvm_countercubit_view.dart';
import 'package:learnapp/design_patterns/mvvm/counter/cubit/mvvm_countercubit_vm.dart';
import 'package:learnapp/design_patterns/mvvm/counter/getx/mvvm_countergetx_view.dart';
import 'package:learnapp/design_patterns/mvvm/counter/provider/mvvm_counterprovider_model.dart';
import 'package:learnapp/design_patterns/mvvm/counter/provider/mvvm_counterprovider_view.dart';
import 'package:learnapp/design_patterns/mvvm/counter/provider/mvvm_counterprovider_vm.dart';
import 'package:learnapp/design_patterns/mvvm/counter/setstate/mvvm_counter_view.dart';
import 'package:learnapp/network/dio/screens/dio_screen.dart';
import 'package:learnapp/network/http/screens/http_screen.dart';
import 'package:learnapp/sharedpreferences/methods.dart';
import 'package:learnapp/sharedpreferences/screens.dart';
import 'package:learnapp/singletonclass/screen.dart';
import 'package:learnapp/sockets/websocket/screens.dart';
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

void main() async {
  await SharedPref.getInstance.initSharedPref();
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
        BlocProvider(create: (context) => CounterCubitModel()),
        BlocProvider(create: (context) => MvcApiCubitModel()),
        BlocProvider(
          create: (context) => ApiCleanArchBloc(
            ApiCleanArchUseCase(
              ApiCleanArchRepoImpl(ApiCleanArchDataSourceImpl()),
            ),
          )..add(ApiCleanArchInitialEvent()),
        ),
        BlocProvider(create: (context) => MvvmCounterCubitVm()),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          ChangeNotifierProvider(create: (context) => ApiProvider()),
          ChangeNotifierProvider(create: (context) => ProviderCounterModel(0)),
          ChangeNotifierProvider(create: (context) => MvcProviderApiModel({})),
          ChangeNotifierProvider(
            create: (context) =>
                MvvmCounterProviderVm(MvvmCounterProviderModel(0)),
          ),
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
          // home: ApiGetxScreen(),
          // home: SingleTonScreen(),
          // home: SharedPrefScreen(),
          // home: WebSocketScreen(),
          // home: CounterSetStateScreen(),
          // home: MvcProviderCounterScreen(),
          // home: CounterCubitView(),
          // home: GetCounterView(),
          // home: MvcApiSetStateView(),
          // home: MvcApiProviderScreen(),
          // home: GetxApiView(),
          // home: MvcApiCubitView(),
          // home: ApiCleanArchScreen(),
          // home: MvvmCounterView(),
          // home: MvvmCounterProviderView(),
          // home: MvvmCounterGetxView(),
          home: MvvmCounterCubitView(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
