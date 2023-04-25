import 'package:flutter/material.dart';

Widget cleanText(String text) {
  String wrongPassword = '[firebase_auth/wrong-password]';
  String userNotFound = '[firebase_auth/user-not-found]';
  String userDisabled = '[firebase_auth/user-disabled]';
  String operationNotAllowed = '[firebase_auth/operation-not-allowed]';
  String emailAlreadyInUse = '[firebase_auth/email-already-in-use]';
  String weakPassword = '[firebase_auth/weak-password]';
  String invalidEmail = '[firebase_auth/invalid-email]';
  String credentialAlreadyInUse = '[firebase_auth/credential-already-in-use]';
  return Text(text
      .replaceAll(weakPassword, '')
      .replaceAll(userNotFound, '')
      .replaceAll(userDisabled, '')
      .replaceAll(operationNotAllowed, '')
      .replaceAll(emailAlreadyInUse, '')
      .replaceAll(invalidEmail, '')
      .replaceAll(credentialAlreadyInUse, '')
      .replaceAll(wrongPassword, ''));
}
