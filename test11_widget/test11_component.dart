// ignore: depend_on_referenced_packages
import 'package:creatego_interface/creatego_interface.dart';
import 'package:flutter/material.dart';

class CustomTest11Options {
  CustomTest11Options({
    required this.component_width,
    required this.component_height,
    

    
  });

  //required variables
  final double component_width;
  final double component_height;
  

  //custom variables
  
}

class _State {
  //required variables
 final double component_width = 400.0;
 final double component_height = 450.0;
 

  //custom variables
 

  CustomTest11Options get options => CustomTest11Options(
        component_width: component_width,
        component_height: component_height,
       
      
      );
}

class CustomTest11Component extends IWidget<CustomTest11Options> {
  final _state = _State();

  CustomTest11Component({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, {ValueChanged<IWidget>? onTapped}) {
    return ValueListenableBuilder<CustomTest11Options>(
      valueListenable: notifier,
      builder: (context, value, child) {
        return _CustomTest11Widget(value);
      },
    );
  }

  
  @override
  IWidget copy() {
    final CustomTest11Component newWidget = CustomTest11Component();
    return newWidget;
  }

 @override
  CustomTest11Options setOptions() {
    return _state.options;
  }

    @override
  WidgetType get widgetType => WidgetType.test;
}


class _CustomTest11Widget extends StatelessWidget {
   _CustomTest11Widget(this.options,{Key? key}) : super(key: key);

  final CustomTest11Options options;


  @override
  Widget build(BuildContext context) {
  return Container(
    color: Colors.white,
    width: options.component_width,
    height: options.component_height,
    child: Stack(
    children: [
  
      Positioned(
        left: 100.0,
        top: 0.0,
        width: 200.0,
        height: 100.0,
        child:
        Center( child: CustomButton(customOptions: ButtonOptions.fromMap({"text": ""Button Text"", "backgroundColor": 4294190070, "fontSize": 16.0, "fontWeight": 3, "textColor": 4294967295, "borderRadius": 0.0, "isIconRight": 'false'}))),
      ),
  
    ],
    ),
);
  }
}