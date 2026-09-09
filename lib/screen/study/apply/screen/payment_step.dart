import 'package:flutter/material.dart';
import 'package:natham_college/model/application_form_model.dart';

class PaymentStep extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ApplicationFormData data;
  final ValueChanged<bool>? onFormChanges;
  const PaymentStep({
    super.key,
    required this.formKey,
    required this.data,
    this.onFormChanges,
  });

  @override
  State<PaymentStep> createState() => _PaymentStepState();
}

class _PaymentStepState extends State<PaymentStep> {
  late String _selectedGateway = widget.data.paymentGateway ?? 'esewa';

  @override
  void initState() {
    super.initState();
    // default to esewa if nothing picked yet, matching the reference UI
    widget.data.paymentGateway = _selectedGateway;
  }

  void _selectGateway(String gateway) {
    setState(() {
      _selectedGateway = gateway;
      widget.data.paymentGateway = gateway;
    });
    widget.onFormChanges?.call(true);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text(
            '7. Payment',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            "Choose eSewa or connectIPS. You will be redirected to the selected gateway's secure payment page.",
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
          ),
          const SizedBox(height: 16),

          // Application Fee card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Application Fee',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFCE9E9),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AMOUNT PAYABLE',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.red.shade700,
                          letterSpacing: 0.3,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'NPR 1,000',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'Base application fee NPR 1,000 includes Open. Each additional category adds NPR 200.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                _GatewayOption(
                  gatewayKey: 'esewa',
                  iconLabel: 'e',
                  iconColor: const Color(0xFF60BB46),
                  title: 'Pay with eSewa',
                  badge: 'SANDBOX',
                  selected: _selectedGateway == 'esewa',
                  onTap: () => _selectGateway('esewa'),
                ),
                const SizedBox(height: 12),
                _GatewayOption(
                  gatewayKey: 'connectips',
                  iconLabel: 'c',
                  iconColor: Colors.blue.shade700,
                  title: 'Pay with connectIPS',
                  selected: _selectedGateway == 'connectips',
                  onTap: () => _selectGateway('connectips'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Payment Instructions card
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Payment Instructions',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                _InstructionItem(
                  number: 1,
                  text:
                      'Select a gateway, then continue to save the application and open payment.',
                ),
                _InstructionItem(
                  number: 2,
                  text: "Sign in on the selected gateway's official page.",
                ),
                _InstructionItem(
                  number: 3,
                  text: 'Enter the OTP token and complete payment.',
                ),
              ],
            ),
          ),
            
          ],
        ),
      ),
    );
  }
}


class _GatewayOption extends StatelessWidget {
  final String gatewayKey;
  final String iconLabel;
  final Color iconColor;
  final String title;
  final String? badge;
  final bool selected;
  final VoidCallback onTap;

  const _GatewayOption({
    required this.gatewayKey,
    required this.iconLabel,
    required this.iconColor,
    required this.title,
    this.badge,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: selected ? iconColor.withValues(alpha: 0.08) : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? iconColor : Colors.grey.shade300,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: iconColor,
              child: Text(
                iconLabel,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'PAYMENT GATEWAY',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: selected ? iconColor : Colors.grey.shade500,
                      letterSpacing: 0.3,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  if (badge != null) ...[
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: iconColor,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        badge!,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            if (selected)
              Icon(Icons.check_circle, color: iconColor, size: 20),
          ],
        ),
      ),
    );
  }
}

class _InstructionItem extends StatelessWidget {
  final int number;
  final String text;

  const _InstructionItem({required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
              fontSize: 13,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}