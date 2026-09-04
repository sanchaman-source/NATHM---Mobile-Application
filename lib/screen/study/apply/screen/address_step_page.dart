import 'package:flutter/material.dart';
import 'package:natham_college/model/application_form_model.dart';

class AddressForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ApplicationFormData data;
  const AddressForm({
    super.key,
    required this.formKey,
    required this.data,
    required this.onFormChanges,
  });

  final ValueChanged<bool> onFormChanges;

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late final TextEditingController _permProvince =
      TextEditingController(text: widget.data.tempProvince);
  late final TextEditingController _permDistrict =
      TextEditingController(text: widget.data.tempDistrict);
  late final TextEditingController _permMunicipality =
      TextEditingController(text: widget.data.tempMunicipality);
  late final TextEditingController _permWard =
      TextEditingController(text: widget.data.tempWard?.toString() ?? '');
  late final TextEditingController _permTole =
      TextEditingController(text: widget.data.tempTole?.toString() ?? '');
  late final TextEditingController _permHouseNo =
      TextEditingController(text: widget.data.tempHouseNo?.toString() ?? '');

  late final TextEditingController _tempProvince =
      TextEditingController(text: widget.data.tempProvince);
  late final TextEditingController _tempDistrict =
      TextEditingController(text: widget.data.tempDistrict);
  late final TextEditingController _tempMunicipality =
      TextEditingController(text: widget.data.tempMunicipality);
  late final TextEditingController _tempWard =
      TextEditingController(text: widget.data.tempWard?.toString() ?? '');
  late final TextEditingController _tempTole =
      TextEditingController(text: widget.data.tempTole?.toString() ?? '');
  late final TextEditingController _tempHouseNo =
      TextEditingController(text: widget.data.tempHouseNo?.toString() ?? '');

  late bool _sameAsPermanent = widget.data.sameAsPermanent;

  bool get _isFormCompleted {
    return _permProvince.text.trim().isNotEmpty &&
        _permDistrict.text.trim().isNotEmpty &&
        _permMunicipality.text.trim().isNotEmpty &&
        _permWard.text.trim().isNotEmpty &&
        _permTole.text.trim().isNotEmpty;
  }

  void _notifyFormChanges() {
    widget.onFormChanges(_isFormCompleted);
  }

  @override
  void dispose() {
    _permProvince.dispose();
    _permDistrict.dispose();
    _permMunicipality.dispose();
    _permWard.dispose();
    _permTole.dispose();
    _permHouseNo.dispose();

    _tempProvince.dispose();
    _tempDistrict.dispose();
    _tempMunicipality.dispose();
    _tempWard.dispose();
    _tempTole.dispose();
    _tempHouseNo.dispose();
    super.dispose();
  }

  void _copyPermanentToTemporary() {
    _tempProvince.text = _permProvince.text;
    _tempDistrict.text = _permDistrict.text;
    _tempMunicipality.text = _permMunicipality.text;
    _tempWard.text = _permWard.text;
    _tempTole.text = _permTole.text;
    _tempHouseNo.text = _permHouseNo.text;

    widget.data.tempProvince = _tempProvince.text;
    widget.data.tempDistrict = _tempDistrict.text;
    widget.data.tempMunicipality = _tempMunicipality.text;
    widget.data.tempWard = int.tryParse(_tempWard.text);
    widget.data.tempTole = int.tryParse(_tempTole.text);
    widget.data.tempHouseNo = int.tryParse(_tempHouseNo.text);
  }

  void _clearTemporary() {
    _tempProvince.clear();
    _tempDistrict.clear();
    _tempMunicipality.clear();
    _tempWard.clear();
    _tempTole.clear();
    _tempHouseNo.clear();

    widget.data.tempProvince = '';
    widget.data.tempDistrict = '';
    widget.data.tempMunicipality = '';
    widget.data.tempWard = null;
    widget.data.tempTole = null;
    widget.data.tempHouseNo = null;
  }

  String? _requiredValidator(String? v) {
    return v == null || v.trim().isEmpty ? 'This field is Required' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '2. Permanent Address',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),
            const SizedBox(height: 24),

            _buildLabel('PROVINCE (EN)', isRequired: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _permProvince,
              validator: _requiredValidator,
              onChanged: (v) {
                widget.data.tempProvince = v;
                _notifyFormChanges();
              },
            ),
            const SizedBox(height: 20),

            _buildLabel('DISTRICT (EN)', isRequired: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _permDistrict,
              validator: _requiredValidator,
              onChanged: (v) {
                widget.data.tempDistrict = v;
                _notifyFormChanges();
              },
            ),
            const SizedBox(height: 20),

            _buildLabel('MUNICIPALITY (EN)', isRequired: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _permMunicipality,
              validator: _requiredValidator,
              onChanged: (v) {
                widget.data.tempMunicipality = v;
                _notifyFormChanges();
              },
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('WARD', isRequired: true),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _permWard,
                        keyboardType: TextInputType.number,
                        validator: _requiredValidator,
                        onChanged: (v) {
                          widget.data.tempWard = int.tryParse(v);
                          _notifyFormChanges();
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('TOLE (EN)', isRequired: true),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _permTole,
                        keyboardType: TextInputType.number,
                        validator: _requiredValidator,
                        onChanged: (v) {
                          widget.data.tempTole = int.tryParse(v);
                          _notifyFormChanges();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            _buildLabel('HOUSE NO.'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _permHouseNo,
              keyboardType: TextInputType.number,
              onChanged: (v) {
                widget.data.tempHouseNo = int.tryParse(v);
                _notifyFormChanges();
              },
            ),

            const SizedBox(height: 40),

            const Text(
              'Temporary Address',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1A1A1A),
              ),
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: _sameAsPermanent,
                    onChanged: (value) {
                      setState(() {
                        _sameAsPermanent = value ?? false;
                        widget.data.sameAsPermanent = _sameAsPermanent;
                        if (_sameAsPermanent) {
                          _copyPermanentToTemporary();
                        } else {
                          _clearTemporary();
                        }
                      });
                      _notifyFormChanges();
                    },
                    activeColor: const Color(0xFF1976D2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                const Text(
                  'Same as permanent address',
                  style: TextStyle(fontSize: 13, color: Color(0xFF4A4A4A)),
                ),
              ],
            ),
            const SizedBox(height: 24),

            IgnorePointer(
              ignoring: _sameAsPermanent,
              child: Opacity(
                opacity: _sameAsPermanent ? 0.6 : 1.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('PROVINCE (EN)', isRequired: true),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _tempProvince,
                      validator: _sameAsPermanent ? null : _requiredValidator,
                      onChanged: (v) {
                        widget.data.tempProvince = v;
                        _notifyFormChanges();
                      },
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('DISTRICT (EN)', isRequired: true),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _tempDistrict,
                      validator: _sameAsPermanent ? null : _requiredValidator,
                      onChanged: (v) {
                        widget.data.tempDistrict = v;
                        _notifyFormChanges();
                      },
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('MUNICIPALITY (EN)', isRequired: true),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _tempMunicipality,
                      validator: _sameAsPermanent ? null : _requiredValidator,
                      onChanged: (v) {
                        widget.data.tempMunicipality = v;
                        _notifyFormChanges();
                      },
                    ),
                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('WARD', isRequired: true),
                              const SizedBox(height: 8),
                              _buildTextField(
                                controller: _tempWard,
                                keyboardType: TextInputType.number,
                                validator: _sameAsPermanent
                                    ? null
                                    : _requiredValidator,
                                onChanged: (v) {
                                  widget.data.tempWard = int.tryParse(v);
                                  _notifyFormChanges();
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildLabel('TOLE (EN)', isRequired: true),
                              const SizedBox(height: 8),
                              _buildTextField(
                                controller: _tempTole,
                                keyboardType: TextInputType.number,
                                validator: _sameAsPermanent
                                    ? null
                                    : _requiredValidator,
                                onChanged: (v) {
                                  widget.data.tempTole = int.tryParse(v);
                                  _notifyFormChanges();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    _buildLabel('HOUSE NO.'),
                    const SizedBox(height: 8),
                    _buildTextField(
                      controller: _tempHouseNo,
                      keyboardType: TextInputType.number,
                      onChanged: (v) {
                        widget.data.tempHouseNo = int.tryParse(v);
                        _notifyFormChanges();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text, {bool isRequired = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF4A4A4A),
          letterSpacing: 0.3,
        ),
        children: [
          if (isRequired)
            const TextSpan(
              text: ' *',
              style: TextStyle(
                color: Color(0xFFE53935),
                fontWeight: FontWeight.w600,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onChanged: onChanged,
      style: const TextStyle(fontSize: 13, color: Color(0xFF1A1A1A)),
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFF1976D2), width: 1.5),
        ),
        errorStyle: const TextStyle(fontSize: 11),
      ),
    );
  }
}