# RondoByte — Landing Page

Landing page institucional da **RondoByte**, construída com **Flutter Web**.

## Stack

- Flutter (web)
- `flutter_svg` — renderização do logo e do foguete
- `url_launcher` — abrir links de contato
- `google_fonts` — tipografia Poppins

## Como rodar

Pré-requisito: Flutter SDK 3.19+ instalado (`flutter doctor`).

```bash
flutter pub get
flutter run -d chrome
```

Para gerar o build de produção:

```bash
flutter build web --release
```

Os arquivos prontos para deploy ficam em `build/web/`.

## Estrutura

```
lib/
  main.dart                  # entrypoint + layout principal
  theme/app_theme.dart       # cores e tema
  widgets/
    nav_bar.dart             # barra superior com logo
    scrolling_rocket.dart    # foguete animado conforme o scroll
  sections/
    hero_section.dart
    about_section.dart
    services_section.dart
    contact_section.dart
assets/images/
  logo.svg                   # logo RondoByte (header)
  rocket.svg                 # foguete animado
web/
  favicon.svg                # favicon do site
  index.html / manifest.json
```

## Contatos

- Instagram: [@rondobyte](https://instagram.com/rondobyte)
- LinkedIn: [linkedin.com/company/112506054](https://www.linkedin.com/company/112506054)
- Email: RondoByte@gmail.com
