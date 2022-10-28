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
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Título',
                hintText: 'Título',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Descrição',
                hintText: 'Descrição',
              ),
              maxLength: 200,
              minLines: 2,
              maxLines: 5,
              cursorColor: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildButtonDialog(
                  'Salvar',
                  () {},
                ),
                buildButtonDialog(
                  'Cancelar',
                  () => Navigator.pop(context),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton buildButtonDialog(String title, Function() function) {
    return ElevatedButton(
      onPressed: function,
      child: Text(title),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.only(left: 20, right: 20),
      ),
    );
  }
}
