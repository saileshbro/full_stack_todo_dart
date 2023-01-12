import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fullstack_todo/core/di/locator.dart';
import 'package:fullstack_todo/presentation/maintain_todo/maintain_todo_viewmodel.dart';
import 'package:models/models.dart';
import 'package:stacked/stacked.dart';

class MaintainTodoView extends HookWidget {
  const MaintainTodoView(this.todo, {super.key});
  final Todo? todo;

  @override
  Widget build(BuildContext context) {
    final titleController = useTextEditingController(text: todo?.title);
    final descriptionController =
        useTextEditingController(text: todo?.description);
    final titleFocusNode = useFocusNode();
    final descriptionFocusNode = useFocusNode();
    final checkBoxFocusNode = useFocusNode();
    final buttonFocusNode = useFocusNode();
    return ViewModelBuilder<MaintainTodoViewModel>.nonReactive(
      onModelReady: (model) => model.init(todo),
      viewModelBuilder: locator,
      builder: (
        BuildContext context,
        MaintainTodoViewModel model,
        Widget? child,
      ) {
        return Scaffold(
          appBar: AppBar(
            title: Text('${todo == null ? 'Create' : 'Edit'} Todo'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  key: const Key('titleTextField'),
                  controller: titleController,
                  focusNode: titleFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: model.onTitleChanged,
                  onEditingComplete: descriptionFocusNode.requestFocus,
                ),
                const SizedBox(height: 14),
                TextFormField(
                  key: const Key('descriptionTextField'),
                  controller: descriptionController,
                  focusNode: descriptionFocusNode,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: model.onDescriptionChanged,
                  onEditingComplete: checkBoxFocusNode.requestFocus,
                ),
                if (todo != null) const SizedBox(height: 14),
                if (todo != null)
                  SelectorViewModelBuilder<MaintainTodoViewModel, bool>(
                    selector: (model) => model.completed,
                    builder: (context, val, _) {
                      return CheckboxListTile(
                        key: const Key('completedCheckbox'),
                        focusNode: checkBoxFocusNode,
                        contentPadding: EdgeInsets.zero,
                        title: const Text('Mark Completed'),
                        value: val,
                        onChanged: (v) => model.onCompletedChanged(value: v),
                      );
                    },
                  ),
                const Spacer(),
                SelectorViewModelBuilder<MaintainTodoViewModel, bool>(
                  selector: (model) => model.isValidated,
                  builder: (context, validated, child) {
                    if (validated) return child!;
                    return const SizedBox.shrink();
                  },
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      key: const Key('saveButton'),
                      focusNode: buttonFocusNode,
                      onPressed: model.handleTodo,
                      child:
                          SelectorViewModelBuilder<MaintainTodoViewModel, bool>(
                        selector: (model) => model.isBusy,
                        builder: (context, isBusy, child) {
                          if (isBusy) return child!;
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.save,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Save',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          );
                        },
                        child: const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
