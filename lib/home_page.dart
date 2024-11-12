import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Counter App",
          style: const TextStyle(
              color: Colors.black54,
              fontSize: 22.0,
              fontWeight: FontWeight.w500),
        ),
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: 80.0,
                    width: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(color: Colors.black12)),
                    child: Center(
                        child: Text(
                      state.toString(),
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500),
                    ))),
                const SizedBox(height: 20.0),
                CustomButton(
                    title: "Increment",
                    isIncrement: true,
                    onTap: () {
                      context.read<CounterBloc>().add(IncrementCounterEvent());
                    }),
                const SizedBox(height: 20.0),
                CustomButton(
                    title: "Decrement",
                    isIncrement: false,
                    onTap: () {
                      context
                          .read<CounterBloc>()
                          .add(DecrementCounterEvent(currentValue: state));
                    })
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.title,
      required this.isIncrement,
      required this.onTap});
  final String title;
  final bool isIncrement;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 80.0,
        width: 250.0,
        decoration: BoxDecoration(
            color: isIncrement ? Colors.green : Colors.redAccent,
            borderRadius: BorderRadius.circular(12.0)),
        child: Center(
            child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16.0, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }
}
