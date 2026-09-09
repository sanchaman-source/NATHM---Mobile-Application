import 'package:flutter/material.dart';
import 'package:natham_college/model/application_form_model.dart';

class DeclarationStep extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ApplicationFormData data;
  final ValueChanged<bool> onFormChanges;

  const DeclarationStep({
    super.key,
    required this.formKey,
    required this.data,
    required this.onFormChanges,
  });

  @override
  State<DeclarationStep> createState() => _DeclarationStepState();
}

class _DeclarationStepState extends State<DeclarationStep> {
  late final TextEditingController _signatureCtrl;
  late bool _agreed;

  @override
  void initState() {
    super.initState();
    _agreed = widget.data.declarationAgreed;
    _signatureCtrl = TextEditingController(text: widget.data.signatureFullName ?? '');
  }

  @override
  void dispose() {
    _signatureCtrl.dispose();
    super.dispose();
  }

  bool get _isFormCompleted {
    return _agreed && _signatureCtrl.text.trim().isNotEmpty;
  }

  void _notify() {
    widget.onFormChanges(_isFormCompleted);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '5. Declaration',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFF9FAFB),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text(
                  'I hereby declare that all the information provided in this application is true, complete, and correct to the best of my knowledge. I understand that any false information or omission may lead to the rejection of my application or cancellation of admission.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 12,
                    height: 1.5,
                    color: Color(0xFF374151),
                  ),
                ),
                const SizedBox(height: 20),

                // Checkbox
                FormField<bool>(
                  initialValue: _agreed,
                  validator: (value) {
                    if (value != true) {
                      return 'You must agree to the declaration';
                    }
                    return null;
                  },
                  builder: (state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Checkbox(
                                value: _agreed,
                                activeColor: const Color(0xFF1976D2),
                                onChanged: (val) {
                                  setState(() {
                                    _agreed = val ?? false;
                                    widget.data.declarationAgreed = _agreed;
                                  });
                                  state.didChange(_agreed);
                                  _notify();
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(top: 2),
                                child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'I agree to the above declaration ',
                                        style: TextStyle(
                                          fontSize: 13.5,
                                          color: Color(0xFF1A1A1A),
                                        ),
                                      ),
                                      TextSpan(
                                        text: '*',
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (state.hasError)
                          Padding(
                            padding: const EdgeInsets.only(left: 34, top: 4),
                            child: Text(
                              state.errorText!,
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 12,
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Signature
                RichText(
                  text: const TextSpan(
                    text: 'SIGNATURE (FULL NAME)',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF374151),
                      letterSpacing: 0.3,
                    ),
                    children: [
                      TextSpan(
                        text: ' *',
                        style: TextStyle(color: Colors.redAccent),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _signatureCtrl,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Type your full name as signature',
                    hintStyle: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF9CA3AF),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color(0xFF1976D2),
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Signature is required';
                    }
                    return null;
                  },
                  onChanged: (v) {
                    widget.data.signatureFullName = v;
                    _notify();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}