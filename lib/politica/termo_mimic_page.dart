import 'package:flutter/material.dart';

import 'politica_page.dart';

/// Privacy Policy — Mimic Hub (Advinha Me)
///
/// O início da política veio do texto fornecido. As seções 1–10 foram
/// reconstruídas no mesmo padrão da política do Chues, adaptadas ao app
/// Advinha Me / Mimic Hub (e-mail e data originais). Revise e substitua
/// se recuperar o documento completo.
class TermoMimicPage extends StatelessWidget {
  const TermoMimicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PoliticaPage(
      title: 'Mimic Hub (Advinha Me)',
      subtitle:
          'Privacy Notice for Marcos Junior Faccin describing how and why we '
          'might access, collect, store, use, and/or share your personal '
          'information when you use our Services.',
      lastUpdated: 'June 05, 2025',
      intro: [
        'This Privacy Notice for Marcos Junior Faccin ("we," "us," or "our"), '
            'describes how and why we might access, collect, store, use, and/or '
            'share ("process") your personal information when you use our '
            'services ("Services"), including when you:',
        'Download and use our mobile application (Advinha Me), or any other '
            'application of ours that links to this Privacy Notice.',
        'Use Advinha Me (Mimic Hub) — a guess-who game with a mimic option '
            'included. Its target audience is family friendly.',
        'Engage with us in other related ways, including any sales, marketing, '
            'or events.',
        'Questions or concerns? Reading this Privacy Notice will help you '
            'understand your privacy rights and choices. We are responsible for '
            'making decisions about how your personal information is processed. '
            'If you do not agree with our policies and practices, please do not '
            'use our Services. If you still have any questions or concerns, '
            'please contact us at faccinambiental@gmail.com.',
      ],
      summaryBullets: [
        'What personal information do we process? When you visit, use, or '
            'navigate our Services, we may process personal information '
            'depending on how you interact with us and the Services, the '
            'choices you make, and the products and features you use.',
        'Do we process any sensitive personal information? Some of the '
            'information may be considered "special" or "sensitive" in certain '
            'jurisdictions, for example your racial or ethnic origins, sexual '
            'orientation, and religious beliefs. We do not process sensitive '
            'personal information.',
        'Do we collect any information from third parties? We do not collect '
            'any information from third parties.',
        'How do we process your information? We process your information to '
            'provide, improve, and administer our Services, communicate with '
            'you, for security and fraud prevention, and to comply with law. '
            'We may also process your information for other purposes with your '
            'consent. We process your information only when we have a valid '
            'legal reason to do so.',
        'In what situations and with which parties do we share personal '
            'information? We may share information in specific situations and '
            'with specific third parties.',
        'How do we keep your information safe? We have adequate organizational '
            'and technical processes and procedures in place to protect your '
            'personal information. However, no electronic transmission over '
            'the internet or information storage technology can be guaranteed '
            'to be 100% secure.',
        'What are your rights? Depending on where you are located '
            'geographically, the applicable privacy law may mean you have '
            'certain rights regarding your personal information.',
        'How do you exercise your rights? The easiest way to exercise your '
            'rights is by submitting a data subject access request, or by '
            'contacting us. We will consider and act upon any request in '
            'accordance with applicable data protection laws.',
      ],
      tocItems: [
        '1. WHAT INFORMATION DO WE COLLECT?',
        '2. HOW DO WE PROCESS YOUR INFORMATION?',
        '3. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL INFORMATION?',
        '4. HOW LONG DO WE KEEP YOUR INFORMATION?',
        '5. HOW DO WE KEEP YOUR INFORMATION SAFE?',
        '6. WHAT ARE YOUR PRIVACY RIGHTS?',
        '7. CONTROLS FOR DO-NOT-TRACK FEATURES',
        '8. DO WE MAKE UPDATES TO THIS NOTICE?',
        '9. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?',
        '10. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?',
      ],
      sections: [
        PoliticaSection(
          heading: '1. WHAT INFORMATION DO WE COLLECT?',
          subsections: [
            PoliticaSubsection(
              heading: 'Personal information you disclose to us',
              paragraphs: [
                'In Short: We collect personal information that you provide to us.',
                'We collect personal information that you voluntarily provide to '
                    'us when you express an interest in obtaining information '
                    'about us or our products and Services, when you participate '
                    'in activities on the Services, or otherwise when you '
                    'contact us.',
                'Sensitive Information. We do not process sensitive information.',
                'Application Data. If you use our application(s), we also may '
                    'collect the following information if you choose to provide '
                    'us with access or permission:',
                'Game Preferences. We may store locally on your device game '
                    'settings, preferences, and scores to enhance your gaming '
                    'experience. This data remains on your device and is not '
                    'transmitted to our servers.',
                'This information is primarily needed to maintain the security '
                    'and operation of our application(s), for troubleshooting, '
                    'and for our internal analytics and reporting purposes.',
                'All personal information that you provide to us must be true, '
                    'complete, and accurate, and you must notify us of any '
                    'changes to such personal information.',
              ],
            ),
          ],
        ),
        PoliticaSection(
          heading: '2. HOW DO WE PROCESS YOUR INFORMATION?',
          inShort:
              'We process your information to provide, improve, and administer '
              'our Services, communicate with you, for security and fraud '
              'prevention, and to comply with law. We may also process your '
              'information for other purposes with your consent.',
          paragraphs: [
            'We process your personal information for a variety of reasons, '
                'depending on how you interact with our Services, including:',
          ],
          bullets: [
            'To evaluate and improve our Services, products, marketing, and '
                'your experience. We may process your information when we '
                'believe it is necessary to identify usage trends, determine '
                'the effectiveness of our promotional campaigns, and to '
                'evaluate and improve our Services, products, marketing, and '
                'your experience.',
            'To identify usage trends. We may process information about how '
                'you use our Services to better understand how they are being '
                'used so we can improve them.',
          ],
        ),
        PoliticaSection(
          heading: '3. WHEN AND WITH WHOM DO WE SHARE YOUR PERSONAL INFORMATION?',
          inShort:
              'We may share information in specific situations described in '
              'this section and/or with the following third parties.',
          paragraphs: [
            'We may need to share your personal information in the following '
                'situations:',
          ],
          bullets: [
            'Business Transfers. We may share or transfer your information in '
                'connection with, or during negotiations of, any merger, sale '
                'of company assets, financing, or acquisition of all or a '
                'portion of our business to another company.',
          ],
        ),
        PoliticaSection(
          heading: '4. HOW LONG DO WE KEEP YOUR INFORMATION?',
          inShort:
              'We keep your information for as long as necessary to fulfill '
              'the purposes outlined in this Privacy Notice unless otherwise '
              'required by law.',
          paragraphs: [
            'We will only keep your personal information for as long as it is '
                'necessary for the purposes set out in this Privacy Notice, '
                'unless a longer retention period is required or permitted by '
                'law (such as tax, accounting, or other legal requirements).',
            'When we have no ongoing legitimate business need to process your '
                'personal information, we will either delete or anonymize such '
                'information, or, if this is not possible (for example, because '
                'your personal information has been stored in backup archives), '
                'then we will securely store your personal information and '
                'isolate it from any further processing until deletion is '
                'possible.',
          ],
        ),
        PoliticaSection(
          heading: '5. HOW DO WE KEEP YOUR INFORMATION SAFE?',
          inShort:
              'We aim to protect your personal information through a system of '
              'organizational and technical security measures.',
          paragraphs: [
            'We have implemented appropriate and reasonable technical and '
                'organizational security measures designed to protect the '
                'security of any personal information we process. However, '
                'despite our safeguards and efforts to secure your information, '
                'no electronic transmission over the Internet or information '
                'storage technology can be guaranteed to be 100% secure, so we '
                'cannot promise or guarantee that hackers, cybercriminals, or '
                'other unauthorized third parties will not be able to defeat '
                'our security and improperly collect, access, steal, or modify '
                'your information. Although we will do our best to protect your '
                'personal information, transmission of personal information to '
                'and from our Services is at your own risk. You should only '
                'access the Services within a secure environment.',
          ],
        ),
        PoliticaSection(
          heading: '6. WHAT ARE YOUR PRIVACY RIGHTS?',
          inShort:
              'You may review, change, or terminate your account at any time, '
              'depending on your country, province, or state of residence.',
          paragraphs: [
            'Withdrawing your consent: If we are relying on your consent to '
                'process your personal information, which may be express and/or '
                'implied consent depending on the applicable law, you have the '
                'right to withdraw your consent at any time. You can withdraw '
                'your consent at any time by contacting us by using the contact '
                'details provided in the section "HOW CAN YOU CONTACT US ABOUT '
                'THIS NOTICE?" below.',
            'However, please note that this will not affect the lawfulness of '
                'the processing before its withdrawal nor, when applicable law '
                'allows, will it affect the processing of your personal '
                'information conducted in reliance on lawful processing grounds '
                'other than consent.',
            'If you have questions or comments about your privacy rights, you '
                'may email us at faccinambiental@gmail.com.',
          ],
        ),
        PoliticaSection(
          heading: '7. CONTROLS FOR DO-NOT-TRACK FEATURES',
          paragraphs: [
            'Most web browsers and some mobile operating systems and mobile '
                'applications include a Do-Not-Track ("DNT") feature or setting '
                'you can activate to signal your privacy preference not to have '
                'data about your online browsing activities monitored and '
                'collected. At this stage, no uniform technology standard for '
                'recognizing and implementing DNT signals has been finalized. '
                'As such, we do not currently respond to DNT browser signals or '
                'any other mechanism that automatically communicates your '
                'choice not to be tracked online. If a standard for online '
                'tracking is adopted that we must follow in the future, we will '
                'inform you about that practice in a revised version of this '
                'Privacy Notice.',
          ],
        ),
        PoliticaSection(
          heading: '8. DO WE MAKE UPDATES TO THIS NOTICE?',
          inShort:
              'Yes, we will update this notice as necessary to stay compliant '
              'with relevant laws.',
          paragraphs: [
            'We may update this Privacy Notice from time to time. The updated '
                'version will be indicated by an updated "Revised" date at the '
                'top of this Privacy Notice. If we make material changes to '
                'this Privacy Notice, we may notify you either by prominently '
                'posting a notice of such changes or by directly sending you a '
                'notification. We encourage you to review this Privacy Notice '
                'frequently to be informed of how we are protecting your '
                'information.',
          ],
        ),
        PoliticaSection(
          heading: '9. HOW CAN YOU CONTACT US ABOUT THIS NOTICE?',
          paragraphs: [
            'If you have questions or comments about this notice, you may '
                'email us at faccinambiental@gmail.com or contact us by post at:',
            'Marcos Junior Faccin\n'
                'Rua Rio grande do Norte 1354\n'
                "Espigão d'Oeste, Rondônia 76974000\n"
                'Brazil',
          ],
        ),
        PoliticaSection(
          heading:
              '10. HOW CAN YOU REVIEW, UPDATE, OR DELETE THE DATA WE COLLECT FROM YOU?',
          paragraphs: [
            'Based on the applicable laws of your country, you may have the '
                'right to request access to the personal information we collect '
                'from you, details about how we have processed it, correct '
                'inaccuracies, or delete your personal information. You may '
                'also have the right to withdraw your consent to our processing '
                'of your personal information. These rights may be limited in '
                'some circumstances by applicable law. To request to review, '
                'update, or delete your personal information, please email us '
                'at faccinambiental@gmail.com.',
          ],
        ),
      ],
    );
  }
}
