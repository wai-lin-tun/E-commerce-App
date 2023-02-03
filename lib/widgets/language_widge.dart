import 'package:ecommerce_app/l10n/l10n.dart';
import 'package:ecommerce_app/service/provider/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: locale,
        icon: Container(width: 12),
        items: L10n.all.map(
          (locale) {
            final flag = L10n.getFlag(locale.languageCode);
            final name = L10n.getName(locale.languageCode);

            return DropdownMenuItem(
              child: Center(
                child: Row(
                  children: [
                    Text(
                      flag,
                      style: TextStyle(fontSize: 32),
                    ),
                     Text(name),
                  ],
                ),
              ),
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
              },
            );
          },
        ).toList(),
        onChanged: (_) {
          
        },
      ),
    );
  }
}
