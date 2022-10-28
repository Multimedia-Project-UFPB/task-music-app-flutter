import 'package:flutter/material.dart';

class NewTskDialog extends StatelessWidget {
  const NewTskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nova Tarefa',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            Form(
              child: Column(
                children: [
                  BuildTextFormField(
                    labelText: 'Título',
                    hintText: 'Título',
                  ),
                  const SizedBox(height: 10),
                  BuildTextFormField(
                    labelText: 'Título',
                    hintText: 'Título',
                    maxLength: 200,
                    maxLines: 5,
                    minLines: 2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BuildButtonDialog(
                        title: 'Salvar',
                        function: () {},
                        left: 20,
                        rigth: 20,
                      ),
                      BuildButtonDialog(
                        title: 'Cancelar',
                        function: () => Navigator.pop(context),
                        rigth: 12,
                        left: 12,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildButtonDialog extends StatelessWidget {
  final double left;
  final double rigth;
  const BuildButtonDialog({
    Key? key,
    required this.title,
    required this.function,
    required this.left,
    required this.rigth,
  }) : super(key: key);

  final String title;
  final Function() function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      child: Text(title),
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.only(
          left: left,
          right: rigth,
        ),
      ),
    );
  }
}

class BuildTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final int? maxLength;
  final int? minLines;
  final int? maxLines;
  const BuildTextFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    this.maxLength,
    this.minLines,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: labelText,
        hintText: hintText,
      ),
      maxLength: maxLength,
      minLines: minLines,
      maxLines: maxLines,
      cursorColor: Theme.of(context).colorScheme.primary,
    );
  }
}
