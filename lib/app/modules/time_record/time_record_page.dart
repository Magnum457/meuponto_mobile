import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/life_cycle/page_life_cicle_state.dart';

import '../../core/ui/widgets/custom_app_bar.dart';

import 'time_record_store.dart';

part 'widgets/time_record_registers_widget.dart';
part 'widgets/custom_radio_button_widget.dart';

class TimeRecordPage extends StatefulWidget {
  final String title;
  const TimeRecordPage({Key? key, this.title = 'Registrar Ponto'})
      : super(key: key);

  @override
  State<TimeRecordPage> createState() => _TimeRecordPageState();
}

class _TimeRecordPageState
    extends PageLifeCycleState<TimeRecordStore, TimeRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _TimeRecordRegistersWidget(store),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.green,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.15,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 15,
                    childAspectRatio: 4,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return _CustomRadioButtonWidget(
                      store,
                      store.getOptionToRegisterType(index),
                      index,
                    );
                  },
                  itemCount: 4,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () async {
                    await store.createTimeRecord();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Registrar o ponto',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
