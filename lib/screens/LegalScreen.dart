import 'package:flutter/material.dart';
import 'package:payuca_case_study/config/colors.dart';
import 'package:payuca_case_study/widgets/BackArrowButton.dart';

class LegalScreen extends StatefulWidget {
  @override
  _LegalScreenState createState() => _LegalScreenState();
}

class _LegalScreenState extends State<LegalScreen> {
  @override
  Widget build(BuildContext context) {
    final TextTheme _textTheme = Theme.of(context).textTheme;

    return Material(
      color: white,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BackArrowButton(
                onTap: () => Navigator.pop(context),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 40.0),
                child: Text(
                  'Terms & Conditions',
                  style: _textTheme.headline2!.merge(
                    const TextStyle(
                      color: black,
                    ),
                  ),
                ),
              ),
              Text(
                '1. Geltungsbereich',
                style: _textTheme.headline4!.merge(
                  const TextStyle(
                    color: black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: Text(
                  'Die vorliegende Datenschutzerklärung erläutert die Art, den Umfang und den Zweck der Erhebung und Verwendung personenbezogener Daten durch die PAYUCA GmbH (im Folgenden „PAYUCA“) bei dem Besuch unserer Website, der Nutzung unserer Online-Anwendungen, mobilen Plattformen und Apps, die einen Link zu dieser Datenschutzerklärung enthalten, sowie wie Sie gegebenenfalls die Erfassung solcher Daten unterbinden können. Die personenbezogenen Daten werden sorgfältig behandelt und gemäß den gesetzlichen Datenschutzbestimmungen erhoben, verarbeitet und verwendet, um die Nutzung unserer Website und unser Online-Angebot zu optimieren.',
                  style: _textTheme.bodyText1!.merge(
                    const TextStyle(
                      color: black,
                    ),
                  ),
                ),
              ),
              Text(
                '2. Zweck der Datenerhebung und -verwendung',
                style: _textTheme.headline4!.merge(
                  const TextStyle(
                    color: black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 30.0),
                child: Text(
                  'Die vorliegende Datenschutzerklärung erläutert die Art, den Umfang und den Zweck der Erhebung und Verwendung personenbezogener Daten durch die PAYUCA GmbH (im Folgenden „PAYUCA“) bei dem Besuch unserer Website, der Nutzung unserer Online-Anwendungen, mobilen Plattformen und Apps, die einen Link zu dieser Datenschutzerklärung enthalten, sowie wie Sie gegebenenfalls die Erfassung solcher Daten unterbinden können. Die personenbezogenen Daten werden sorgfältig behandelt und gemäß den gesetzlichen Datenschutzbestimmungen erhoben, verarbeitet und verwendet, um die Nutzung unserer Website und unser Online-Angebot zu optimieren.',
                  style: _textTheme.bodyText1!.merge(
                    const TextStyle(
                      color: black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
