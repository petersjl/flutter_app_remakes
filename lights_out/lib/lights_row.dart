import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'lights_out_view_model.dart';

class LightsRow extends StatelessWidget {
  const LightsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LightsOutViewModel>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(viewModel.lights.length, (index) {
        final isLightOn = viewModel.lights[index];
        return IconButton(
          icon: Icon(
            isLightOn ? Icons.lightbulb : Icons.lightbulb_outline,
            color: isLightOn ? Colors.yellow : Colors.grey,
          ),
          onPressed:
              viewModel.gameWon
                  ? null
                  : () {
                    viewModel.toggleLight(index);
                  },
        );
      }),
    );
  }
}
