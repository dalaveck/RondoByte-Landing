# RondoByte — Landing Page

Landing page institucional da **RondoByte**, construída com **Flutter Web**.

## Stack

- Flutter (web)
- `flutter_svg` — renderização do logo e do foguete
- `url_launcher` — abrir links de contato
- `google_fonts` — tipografia Poppins

## Logo

A logo oficial da RondoByte já está incluída no repositório:

- `assets/images/logo.png` (1772×1772) — usada no canto superior esquerdo
- `web/favicon.png` (512×512) e `web/favicon-16.png` (16×16) — favicons
- `web/icons/Icon-192.png` e `Icon-512.png` — ícones do PWA
- `web/icons/apple-touch-icon.png` (180×180) — ícone iOS

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

## Deploy na Vercel

O `vercel.json` na raiz já configura tudo. No painel da Vercel:

1. **Import Project** → conecte o repositório do GitHub.
2. Em **Framework Preset** escolha `Other` (a Vercel vai ler o `vercel.json`).
3. **Não** edite `Build Command`, `Output Directory` nem `Install Command` — os valores corretos já estão no `vercel.json`:
   - `buildCommand`: clona o Flutter stable e roda `flutter build web --release`
   - `outputDirectory`: `build/web`
   - `rewrites`: faz fallback de todas as rotas para `index.html` (SPA)
4. Clique em **Deploy**.

O primeiro build leva ~3–5 minutos porque a Vercel baixa o Flutter SDK. Builds seguintes reaproveitam o cache.

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
  logo.png                   # logo oficial RondoByte
  rocket.svg                 # foguete animado
web/
  favicon.png                # favicon principal (512×512)
  favicon-16.png             # favicon 16×16
  icons/                     # Icon-192/512 e apple-touch-icon
  index.html / manifest.json
```

## Contatos

- Instagram: [@rondobyte](https://instagram.com/rondobyte)
- LinkedIn: [linkedin.com/company/112506054](https://www.linkedin.com/company/112506054)
- Email: RondoByte@gmail.com
