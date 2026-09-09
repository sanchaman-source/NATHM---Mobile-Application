import 'package:flutter/material.dart';
import 'package:natham_college/model/application_form_model.dart';
import 'package:natham_college/widgets/review_section_card.dart';

class ReviewStep extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final ApplicationFormData data;
  final ValueChanged<int> onEditStep;
  const ReviewStep({
    super.key,
    required this.formKey,
    required this.data,
    required this.onEditStep,
  });

  String _v(String? v) =>
      (v != null && v.trim().isNotEmpty) ? v : 'Not provided';
  String _vn(num? v) => v != null ? v.toString() : 'Not provided';
  String _fullName() {
    final parts = [
      data.firstName,
      data.middleName,
      data.lastName,
    ].where((p) => p.trim().isNotEmpty);
    return parts.isEmpty ? 'Not provided' : parts.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReviewSectionCard(
                title: 'Course & Personal Information',
                onEdit: () => onEditStep(1),
                rows: [
                  ('Course', _v(data.course)),
                  ('Full Name', _fullName()),
                  ('Email', _v(data.email)),
                  ('Mobile', _v(data.mobile)),
                  ('Gender', _v(data.gender)),
                  ('Date of Birth (BS)', _v(data.dateOfBirth)),
                  ('Category', _v(data.categories)),
                  ('Religion', _v(data.religion)),
                  ('Nationality', _v(data.nationality)),
                  ('Citizenship No.', _v(data.citizenShip)),
                  ('Passport No.', _v(data.passportNumber)),
                ],
              ),
                
              SizedBox(height: 16),
              ReviewSectionCard(
                title: 'Address',
                onEdit: () => onEditStep(2),
                rows: [
                  ('Province', _v(data.tempProvince)),
                  ('District', _v(data.tempDistrict)),
                  ('Municipality', _v(data.tempMunicipality)),
                  ('Ward', _vn(data.tempWard)),
                  ('Tole', _vn(data.tempTole)),
                  ('House No.', _vn(data.tempHouseNo)),
                ],
              ),
              const SizedBox(height: 16),
              ReviewSectionCard(
                title: 'Parent / Guardian',
                onEdit: () => onEditStep(3),
                rows: [
                  ('Father', _v(data.fatherName)),
                  ('Father Contact', _vn(data.fatherMobile)),
                  ('Mother', _v(data.motherName)),
                  ('Mother Contact', _vn(data.motherMobile)),
                  ('Guardian', _v(data.guardianName)),
                  ('Guardian Relation', _v(data.guardianRelation)),
                  ('Guardian Contact', _vn(data.guardianPhone)),
                ],
              ),
              const SizedBox(height: 16),
              ReviewSectionCard(
                title: 'Class 10 (SEE)',
                onEdit: () => onEditStep(4),
                rows: [
                  ('College', _v(data.seeSchool)),
                  ('Board', _v(data.seeBoard)),
                  ('Year', _v(data.seeYearBS)),
                  (
                    'GPA / %',
                    '${_vn(data.seeGpa)} · ${_vn(data.seePercentage)}%',
                  ),
                  ('Documents', '${data.seeDocuments.length} uploaded'),
                ],
              ),
              const SizedBox(height: 16),
              ReviewSectionCard(
                title: 'Class 12 (+2)',
                onEdit: () => onEditStep(4),
                rows: [
                  ('College', _v(data.class12College)),
                  ('Board', _v(data.class12BoardUniversity)),
                  ('Year', _v(data.class12YearCompletionBS)),
                  (
                    'GPA / %',
                    '${_v(data.class12Gpa)} · ${_v(data.class12Percentage)}%',
                  ),
                  ('Documents', '${data.class12Documents.length} uploaded'),
                  ('CMAT', '${_v(data.cmatRollNo)} / ${_v(data.cmatScore)}'),
                ],
              ),
              const SizedBox(height: 16),
              ReviewSectionCard(
                title: 'Declaration',
                onEdit: () => onEditStep(5),
                rows: [
                  (
                    'Declaration Accepted',
                    data.declarationAgreed ? 'Yes' : 'No',
                  ),
                  ('Signature', _v(data.signatureFullName)),
                ],
              ),
            ],
          ),
        ),
      
    );
  }
}
