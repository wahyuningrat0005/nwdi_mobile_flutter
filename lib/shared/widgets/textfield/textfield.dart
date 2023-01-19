import 'package:nwdi/core.dart';

enum TextFieldType {
  normal,
  password,
}

Map<String, TextEditingController> textFieldController = {};

class NwTextField extends StatefulWidget {
  final String id;
  final String? label;
  final String? value;
  final String hintText;
  final TextFieldType textFieldType;
  final TextInputType? keyboarType;
  final int? maxLines;
  final bool? enabeld;
  final int? style;
  final double? size;
  final Function(String text)? onChanged;
  final Function(String text)? onSubmitted;
  const NwTextField({
    super.key,
    required this.id,
    this.label,
    this.value = "",
    this.hintText = "",
    this.textFieldType = TextFieldType.normal,
    this.keyboarType,
    this.maxLines = 1,
    this.enabeld = true,
    this.style,
    this.size,
    this.onChanged,
    this.onSubmitted,
  });

  @override
  State<NwTextField> createState() => _NwTextFieldState();
}

class _NwTextFieldState extends State<NwTextField>
    implements InputContrrollerState {
  TextEditingController controller = TextEditingController();

  var md;

  @override
  void initState() {
    super.initState();
    controller.text = widget.value ?? "";
    textFieldController[widget.id] = controller;
    Input.set(widget.id, widget.value);
    Input.inputController[widget.id] = this;
  }

  @override
  setValue(value) {
    controller.text = value ?? "";
    Input.set(widget, value);
  }

  @override
  resetValue() {
    controller.text = "";
    Input.set(widget.id, "");
  }

  @override
  Widget build(BuildContext context) {
    double textAreaHeight = 0;
    if (widget.maxLines != null && widget.maxLines! >= 2) {
      textAreaHeight = (widget.size ?? md) * widget.maxLines!;
    }
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          if (widget.label != null) ...[
            Padding(
              padding: const EdgeInsets.only(
                  left: 4.0, right: 4.0, top: 4.0, bottom: 4.0),
              child: Text(widget.label!),
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.0,
                  color: Colors.grey[3000]!,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: TextField(
                controller: controller,
                maxLines: widget.maxLines ?? 1,
                keyboardType: widget.keyboarType,
                obscureText: widget.textFieldType == TextFieldType.password
                    ? true
                    : false,
                readOnly: widget.enabeld! ? false : true,
                decoration: InputDecoration.collapsed(
                  hintText: widget.hintText,
                  hintStyle: TextStyle(
                    fontSize: 10.0,
                    color: Colors.grey[400],
                  ),
                ),
                onChanged: (text) {
                  Input.set(widget.id, text);
                  if (widget.onChanged != null) widget.onChanged!;
                },
                onSubmitted: (text) {
                  Input.set(widget.id, text);
                  if (widget.onSubmitted != null) widget.onSubmitted!;
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
