import 'dart:io';
import 'package:natham_college/screen/study/apply/model/other_qualification.dart';
import 'package:natham_college/screen/study/apply/screen/academic_step.dart';

class ApplicationFormData {
  String? course;
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String email = '';
  String mobile = '';
  String dateOfBirth = '';
  String? gender;
  String? categories;
  String religion = '';
  String nationality = '';
  String citizenShip = '';
  String passportNumber = '';
  File? passportPhoto;
  File? citizenshipFront;
  File? citizenshipBack;

  //ADDRESS FORM DATA///
  String tempProvince = '';
  String tempDistrict = '';
  String tempMunicipality = '';
  int? tempWard;
  int? tempTole;
  int? tempHouseNo;
  bool sameAsPermanent = false;

  //GUARDIAN FORM DATA///

  String fatherName = '';
  String fatherOccupation = '';
  int? fatherMobile;
  String fatherEmail = '';
  String motherName = '';
  String motherOccupation = '';
  int? motherMobile;
  String motherEmail = '';
  String guardianName = '';
  String guardianRelation = '';
  String guardianOccupation = '';
  int? guardianPhone;
  String guardianEmail = '';
  String guardianAddress = '';

  //ACEDEMIC FORM DATA//

  String seeSchool = '';
  String seeBoard = '';
  String seeYearBS = '';
  double? seeGpa;
  double? seePercentage;
  List<UploadedDoc> seeDocuments = [];
  String? class12College;
  String? class12BoardUniversity;
  String? class12YearCompletionBS;
  String? class12Gpa;
  String? class12Percentage;
  List<UploadedDoc> class12Documents = [];

  List<OtherQualification> otherQualifications = [];
  List<UploadedDoc> otherQualificationDocuments = [];

  String? cmatRollNo;
  String? cmatScore;
  List<UploadedDoc> cmatDocuments = [];

  //STEP 5 DECLARATION FORM DATA//

  bool declarationAgreed = false;
  String? signatureFullName;
}
