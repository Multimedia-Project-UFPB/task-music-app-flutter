import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:task_music/app/controller/task_store.dart';

class NewTaskDialog extends StatelessWidget {
  const NewTaskDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<TaskStore>(context);
    final _formKey = GlobalKey<FormState>();
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      height: _size.height / 2.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
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
          const SizedBox(height: 5),
          Observer(
            builder: (_) => Form(
              key: _formKey,
              child: Column(
                children: [
                  buildTextFormFieldTitle(_store, context),
                  const SizedBox(height: 10),
                  buildTextFormFieldDescription(_store, context),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BuildButtonDialog(
                        title: 'Salvar',
                        function: () {
                          print(
                            '${_store.taskModel.title.toString()}\n${_store.taskModel.description.toString()}',
                          );
                        },
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
          ),
        ],
      ),
    );
  }

  TextFormField buildTextFormFieldDescription(
      TaskStore _store, BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Descrição',
        hintText: 'Descrição',
      ),
      onChanged: _store.setDescription,
      maxLength: 200,
      maxLines: 5,
      minLines: 2,
      cursorColor: Theme.of(context).colorScheme.primary,
    );
  }

  TextFormField buildTextFormFieldTitle(
      TaskStore _store, BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        labelText: 'Título',
        hintText: 'Título',
      ),
      onChanged: _store.setTitlte,
      cursorColor: Theme.of(context).colorScheme.primary,
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
