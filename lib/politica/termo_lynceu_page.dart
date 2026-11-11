import 'package:flutter/material.dart';

import 'politica_page.dart';

/// Política de Privacidade — Lynceu
///
/// Só afirma o que o código e os ADRs do repositório `lynceu` e do servidor
/// `lynceu-back` confirmavam em 11/11/2026. Mudou provedor de IA, servidor,
/// sincronização ou fase do roadmap? Revise esta página junto.
class TermoLynceuPage extends StatelessWidget {
  const TermoLynceuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PoliticaPage(
      eyebrow: 'POLÍTICA DE PRIVACIDADE',
      lastUpdatedPrefix: 'Última atualização:',
      summaryHeading: 'RESUMO',
      tocHeading: 'SUMÁRIO',
      inShortPrefix: 'Em resumo',
      title: 'Lynceu',
      subtitle:
          'Política de Privacidade do Lynceu, roteiro de investigação criminal '
          'com apoio de inteligência artificial.',
      lastUpdated: '11 de novembro de 2026',
      highlight:
          'Fase de teste: até a conclusão da fase 8 do desenvolvimento, que '
          'inclui parecer jurídico e auditoria externa de segurança, o Lynceu '
          'só deve receber dados fictícios. Não insira nomes, documentos, '
          'relatos, fotos nem qualquer outro dado real de inquérito, de '
          'vítimas, de suspeitos ou de testemunhas. Os provedores de IA '
          'disponíveis hoje foram aceitos apenas para dados fictícios.',
      intro: [
        'Esta Política de Privacidade descreve como Marcos Junior Faccin '
            '("nós", "nosso" ou "responsável"), na qualidade de controlador de '
            'dados, coleta, utiliza, armazena, compartilha e protege suas '
            'informações pessoais quando você utiliza o aplicativo Lynceu, nas '
            'versões para computador, celular e navegador '
            '(lynceu.rondobyte.com.br). Esta política foi elaborada com base '
            'na Lei Geral de Proteção de Dados Pessoais (LGPD, Lei nº '
            '13.709/2018) e demais normas aplicáveis.',
        'O Lynceu é feito para policiais e foi desenhado para que nós não '
            'consigamos ler o conteúdo dos seus casos: os dados ficam '
            'encriptados no seu aparelho, o servidor guarda apenas cópias '
            'encriptadas antes de saírem do aparelho, e a IA recebe só texto '
            'pseudonimizado, revisado por você antes do envio.',
        'Esta política não é parecer jurídico. Os pontos que ainda dependem '
            'de análise jurídica estão indicados como tal.',
      ],
      tocItems: [
        'Resumo',
        '1. Informações que coletamos',
        '2. Como utilizamos as informações',
        '3. Inteligência artificial',
        '4. Câmera, fotos e permissões do aparelho',
        '5. Compartilhamento',
        '6. Transferência internacional',
        '7. Armazenamento e segurança',
        '8. Retenção e exclusão de conta',
        '9. Seus direitos (LGPD)',
        '10. Menores de idade',
        '11. Cookies',
        '12. Alterações nesta política',
        '13. Contato e encarregado',
        '14. Autoridade Nacional de Proteção de Dados',
      ],
      sections: [
        PoliticaSection(
          heading: 'Resumo',
          tables: [
            PoliticaTabela(
              header: [
                'O que coletamos',
                'Para que usamos',
                'Com quem compartilhamos',
              ],
              rows: [
                [
                  'E-mail, se você criar conta. No servidor, fica só como '
                      'código (HMAC), não em claro',
                  'Entrar em outro aparelho e sincronizar',
                  'DigitalOcean (hospedagem, EUA)',
                ],
                [
                  'Valor derivado da senha. A senha não sai do aparelho',
                  'Confirmar o seu login',
                  'DigitalOcean (hospedagem, EUA)',
                ],
                [
                  'Casos e fotos, encriptados no aparelho antes de sair dele',
                  'Sincronizar os seus aparelhos. Não conseguimos lê-los',
                  'DigitalOcean (hospedagem, EUA), só encriptados',
                ],
                [
                  'Endereço IP, só em memória',
                  'Limitar tentativas de cadastro e login',
                  'Ninguém',
                ],
                [
                  'Texto pseudonimizado de um caso, quando você confirma o '
                      'envio',
                  'Análise e rascunho de relatório por IA',
                  'O provedor de IA que você escolher, com a sua chave: '
                      'Anthropic (EUA), DeepSeek (China) ou OpenRouter (EUA e '
                      'empresa do modelo). Vai direto do seu aparelho, sem '
                      'passar por nós',
                ],
              ],
            ),
          ],
          bullets: [
            'Não usamos analytics, relatório de falhas (crash report), '
                'publicidade nem cookies.',
            'No computador e no celular, você pode usar o Lynceu sem conta: o '
                'cofre fica só no aparelho, e nada é enviado ao nosso servidor.',
          ],
        ),
        PoliticaSection(
          heading: '1. Informações que coletamos',
          inShort:
              'Guardamos o mínimo para você entrar em outro aparelho e '
              'sincronizar. O conteúdo dos casos chega ao servidor encriptado, '
              'e não temos a chave.',
          subsections: [
            PoliticaSubsection(
              heading: '1.1 Informações fornecidas por você',
              bullets: [
                'E-mail (opcional): só se você criar conta para sincronizar. '
                    'Ele passa pelo servidor a cada cadastro e login, '
                    'protegido por HTTPS, mas não é gravado em claro no banco '
                    'de dados: guardamos um código (HMAC) calculado com um '
                    'segredo mantido fora do banco. Durante a fase de teste, o '
                    'cadastro é restrito a e-mails autorizados, e essa lista '
                    'fica em claro na configuração do servidor. O e-mail não é '
                    'verificado e não é usado para enviar mensagens.',
                'Senha: não sai do seu aparelho. Dela, o app deriva (com '
                    'Argon2id) um autenticador, que vai ao servidor e fica '
                    'guardado só como código (HMAC), e uma chave que nunca sai '
                    'do aparelho.',
                'Chave do cofre encapsulada: a chave dos seus dados, '
                    'encriptada no aparelho com a chave derivada da senha, e '
                    'guardada no servidor dentro de mais uma camada de '
                    'encriptação (AES-256-GCM). Sem a sua senha, ela não abre.',
                'Conteúdo dos casos: casos, pessoas, registros, diligências, '
                    'análises e fotos que você inserir. Ficam no cofre '
                    'encriptado do aparelho. Se você ligar a sincronização, '
                    'sobem como blocos encriptados no aparelho, que o servidor '
                    'não consegue abrir. Ele não sabe nem a qual tabela, caso '
                    'ou pessoa cada bloco se refere.',
                'Chave de API do provedor de IA: guardada no banco encriptado '
                    'do aparelho e nunca mostrada de volta. Só vai ao servidor '
                    'se você marcar a opção de sincronizá-la, e aí vai '
                    'encriptada como os demais dados. Com a sincronização '
                    'ligada, a escolha de provedor e de modelo também sobe, '
                    'encriptada.',
                'Código de recuperação: aparece só no seu aparelho, depois da '
                    'senha. O app não o guarda nem o envia a nós.',
              ],
            ),
            PoliticaSubsection(
              heading: '1.2 Informações coletadas automaticamente',
              bullets: [
                'Endereço IP: usado em memória pelo servidor para limitar '
                    'tentativas de cadastro e login, e descartado em até uma '
                    'hora. Pelo mesmo motivo, o código do e-mail fica em '
                    'memória por até 15 minutos. O servidor não grava registro '
                    'de acesso.',
                'Registros técnicos de erro do servidor web podem conter o IP '
                    'e a data e hora de uma falha. Servem só para manter o '
                    'serviço funcionando.',
                'Metadados da conta: identificador da conta (derivado da chave '
                    'do cofre), data de criação, data e hora de cada bloco '
                    'enviado, quantidade de blocos e volume ocupado. O servidor '
                    'vê esses dados, mas não o conteúdo.',
                'Não coletamos identificadores do aparelho, modelo, sistema '
                    'operacional, localização, contatos nem dados de uso. Não '
                    'há analytics nem relatório de falhas no app.',
              ],
            ),
            PoliticaSubsection(
              heading: '1.3 Informações de terceiros',
              paragraphs: [
                'Não recebemos dados seus de terceiros. O conteúdo dos casos '
                    'pode conter dados de outras pessoas (vítimas, suspeitos, '
                    'testemunhas), inseridos por você. Veja a seção 2.1 sobre '
                    'a fase de teste e o art. 4º, III, da LGPD.',
              ],
            ),
          ],
        ),
        PoliticaSection(
          heading: '2. Como utilizamos as informações',
          inShort:
              'Usamos os dados da conta só para o login e a sincronização '
              'funcionarem com segurança. Não vendemos dados, não fazemos '
              'publicidade e não traçamos perfil.',
          tables: [
            PoliticaTabela(
              header: ['Finalidade', 'Base legal (LGPD)'],
              rows: [
                [
                  'Criar a conta, confirmar o login e entregar a chave do cofre '
                      'encapsulada ao seu aparelho',
                  'Execução de contrato (art. 7º, V)',
                ],
                [
                  'Guardar e devolver aos seus aparelhos os blocos e as fotos '
                      'encriptados',
                  'Execução de contrato (art. 7º, V)',
                ],
                [
                  'Restringir o cadastro a e-mails autorizados durante a fase '
                      'de teste',
                  'Procedimentos preliminares relacionados a contrato (art. '
                      '7º, V)',
                ],
                [
                  'Limitar tentativas por IP e por e-mail, aplicar cotas e '
                      'manter cópia de segurança do banco',
                  'Legítimo interesse (art. 7º, IX): segurança do serviço e '
                      'prevenção de abuso',
                ],
                [
                  'Responder pedidos de titulares e cumprir determinações '
                      'legais',
                  'Cumprimento de obrigação legal (art. 7º, II) e exercício '
                      'regular de direitos (art. 7º, VI)',
                ],
                [
                  'Enviar à IA o texto pseudonimizado que você confirmar',
                  'O envio parte do seu aparelho, direto para o provedor, só '
                      'quando você confirma, e não passa pelo nosso servidor. '
                      'Veja as seções 2.1, 3 e 6',
                ],
              ],
            ),
          ],
          subsections: [
            PoliticaSubsection(
              heading:
                  '2.1 Dados dos casos, fase de teste e o art. 4º, III, da LGPD',
              paragraphs: [
                'Até a conclusão da fase 8 do desenvolvimento, que inclui '
                    'parecer jurídico, autorização institucional e auditoria '
                    'externa de segurança, o Lynceu só deve receber dados '
                    'fictícios, que não se referem a pessoa natural '
                    'identificada ou identificável (art. 5º, I). Não insira '
                    'dados reais de inquérito.',
                'O art. 4º, III, da LGPD dispõe que a lei não se aplica ao '
                    'tratamento de dados pessoais realizado para fins '
                    'exclusivos de segurança pública e de atividades de '
                    'investigação e repressão de infrações penais, que deve '
                    'ser regido por legislação específica (§ 1º). O § 2º do '
                    'mesmo artigo trata do tratamento desses dados por pessoa '
                    'de direito privado. Como esse regime se aplica ao Lynceu, '
                    'a quem o usa e a quem o fornece ainda depende de parecer '
                    'jurídico, que não foi emitido. Esta política não conclui '
                    'nada a esse respeito.',
                'Independentemente desse enquadramento, o conteúdo dos casos '
                    'recebe as proteções descritas nas seções 3 e 7, e não '
                    'temos acesso a ele.',
                'Enviar dados de inquérito a terceiros, mesmo pseudonimizados, '
                    'pode exigir autorização do órgão a que você pertence.',
              ],
            ),
          ],
        ),
        PoliticaSection(
          heading: '3. Inteligência artificial',
          inShort:
              'A IA só recebe texto pseudonimizado, que você revisa antes do '
              'envio, e só com a sua chave de API. Isso reduz o risco, mas não '
              'o elimina.',
          subsections: [
            PoliticaSubsection(
              heading: '3.1 Como funciona',
              paragraphs: [
                'A análise do caso (sumário, roteiro, lacunas, contradições e '
                    'sugestões de diligência) e o rascunho do relatório '
                    'técnico são feitos por um modelo de IA de terceiros. '
                    'Antes de qualquer envio, o próprio aparelho troca nomes, '
                    'apelidos, documentos e outros identificadores por '
                    'variáveis, como {{PESSOA_1}} ou {{LOCAL_1}}.',
                'Você vê o texto final na prévia, pode marcar o que escapou e '
                    'confirma o envio. Ao confirmar, o texto é conferido de '
                    'novo, e qualquer resto bloqueia o envio. Se a '
                    'pseudonimização falhar, nada é enviado.',
                'O texto vai direto do seu aparelho para o provedor que você '
                    'escolheu, com a sua chave de API. Não passa pelo nosso '
                    'servidor, e nós não o recebemos. A resposta volta com as '
                    'variáveis, e os nomes são restaurados só no seu aparelho.',
                'A IA não decide nada. Cada sugestão cita o registro de origem '
                    'e só vira registro do caso com decisão sua.',
              ],
            ),
            PoliticaSubsection(
              heading: '3.2 O que é e o que não é enviado',
              bullets: [
                'Vai: o texto dos registros do caso já pseudonimizado, com '
                    'datas relativas ao fato (D0, D+3), idades em faixas '
                    '(30-39) e locais como variáveis acompanhadas do tipo (via '
                    'pública, por exemplo).',
                'Não vai: fotos, número e apelido do caso, os valores reais '
                    'por trás das variáveis, nem dados da sua conta no Lynceu.',
                'Como em qualquer conexão, o provedor recebe também o seu '
                    'endereço IP e a sua chave de API, que liga o envio à sua '
                    'conta nele.',
                'Mensagens de erro do provedor não são lidas nem gravadas, e '
                    'o raciocínio intermediário do modelo é descartado.',
              ],
            ),
            PoliticaSubsection(
              heading: '3.3 Provedores disponíveis',
              paragraphs: [
                'A lista de provedores é fechada, sem campo para endereço '
                    'livre, e a prévia diz para onde o texto vai antes de você '
                    'confirmar. Se o provedor mudar depois da prévia, o envio '
                    'não sai. Hoje o app oferece:',
              ],
              tables: [
                PoliticaTabela(
                  header: ['Provedor', 'Para onde vai', 'Pontos de atenção'],
                  rows: [
                    [
                      'Claude (Anthropic)',
                      'Anthropic, EUA',
                      'Pode guardar o texto por um período, conforme a '
                          'política da API. Retenção zero só por contrato, e '
                          'conteúdo sinalizado pelos sistemas de segurança '
                          'pode ficar retido por mais tempo. Não funciona na '
                          'versão web',
                    ],
                    [
                      'DeepSeek. Padrão do app',
                      'DeepSeek, China',
                      'Pelos termos lidos em novembro de 2026: guarda os dados '
                          'na China, sem prazo de retenção para a API nem '
                          'opção de retenção zero; pode usar entradas e saídas '
                          'para melhorar o serviço; compartilha dados com '
                          'autoridades a pedido do governo; pede que não se '
                          'enviem dados pessoais sensíveis. Único provedor '
                          'disponível na versão web',
                    ],
                    [
                      'OpenRouter (qualquer modelo)',
                      'OpenRouter, EUA, e a empresa do modelo escolhido, no '
                          'país dela',
                      'Soma mais uma empresa no caminho do texto, cada uma '
                          'com a sua política de retenção. Os termos do '
                          'OpenRouter ainda não foram avaliados por nós. Não '
                          'funciona na versão web',
                    ],
                  ],
                ),
              ],
              bullets: [
                'Todos foram aceitos só para a fase de dados fictícios. A '
                    'escolha do provedor para dados reais, pelos termos de '
                    'retenção e de uso, faz parte da fase 8, e a compatibilidade '
                    'dos termos de uso dos provedores com o uso policial ainda '
                    'está em avaliação.',
                'Cada provedor trata os dados segundo a política dele. Depois '
                    'do envio, não temos controle sobre o texto.',
              ],
            ),
            PoliticaSubsection(
              heading: '3.4 Limites da pseudonimização',
              bullets: [
                'Pseudonimizar não é anonimizar. O contexto do relato (fatos, '
                    'circunstâncias, valores) pode permitir reidentificar '
                    'pessoas, sobretudo para quem já conhece o caso.',
                'A detecção automática não é perfeita. Nomes cadastrados no '
                    'caso são sempre protegidos, mas, nos testes com textos '
                    'fictícios, cerca de 1 em cada 5 menções a pessoas fora do '
                    'cadastro dependeu da revisão humana na prévia. Datas e '
                    'idades por extenso ("treze de março", "trinta e cinco '
                    'anos") não são detectadas.',
                'Por isso, cadastre as pessoas do caso e revise a prévia com '
                    'atenção.',
              ],
            ),
            PoliticaSubsection(
              heading: '3.5 Sua chave e seu contrato com o provedor',
              bullets: [
                'Você contrata o provedor diretamente e usa a sua chave de '
                    'API. O uso, a cobrança e o tratamento dos dados por ele '
                    'seguem o contrato e a política de privacidade dele.',
                'Ainda não existe plano com a chave do Lynceu. Se for lançado, '
                    'esta política será atualizada antes.',
              ],
            ),
          ],
        ),
        PoliticaSection(
          heading: '4. Câmera, fotos e permissões do aparelho',
          inShort:
              'A câmera é usada só dentro do app, e as fotos nunca vão para a '
              'galeria nem para a IA.',
          bullets: [
            'Câmera: a foto é capturada dentro do app, nunca pela câmera do '
                'sistema nem pela galeria. Hoje, a captura existe só no '
                'Android. Na versão web não há câmera: as fotos só podem ser '
                'vistas.',
            'Fotos: gravadas encriptadas na área privada do app, fora da '
                'galeria e do backup do sistema, com hash e metadados '
                'calculados na captura. São exibidas a partir da memória, sem '
                'cópia legível em cache. Não são enviadas à IA: para entrar na '
                'análise, você escreve uma descrição, que passa pela '
                'pseudonimização. Com a sincronização ligada, sobem '
                'encriptadas.',
            'Biometria (opcional): onde o sistema oferece, você pode '
                'desbloquear o cofre com a biometria. Quem faz a leitura é o '
                'sistema operacional: o Lynceu não recebe sua digital nem seu '
                'rosto. A senha continua valendo, e quem tiver acesso a uma '
                'biometria cadastrada no aparelho pode abrir o cofre.',
            'Internet: usada só para a análise por IA, para a sincronização e, '
                'na web, para carregar o app. Registrar, consultar e fotografar '
                'funcionam sem rede.',
            'Não pedimos acesso a localização, contatos, microfone nem galeria.',
          ],
        ),
        PoliticaSection(
          heading: '5. Compartilhamento',
          inShort:
              'Não vendemos dados. Só a hospedagem do servidor guarda algo da '
              'sua conta, e encriptado ou em código.',
          subsections: [
            PoliticaSubsection(
              heading: '5.1 Prestadores de serviço',
              tables: [
                PoliticaTabela(
                  header: ['Prestador', 'Finalidade', 'Localização'],
                  rows: [
                    [
                      'DigitalOcean',
                      'Hospedagem do servidor de sincronização (conta, blocos '
                          'e fotos encriptados, cópias de segurança) e da '
                          'versão web',
                      'Nova York, EUA',
                    ],
                    [
                      'Provedor de IA escolhido por você: Anthropic, DeepSeek '
                          'ou OpenRouter',
                      'Análise do texto pseudonimizado. Contratado '
                          'diretamente por você, com a sua chave; o texto não '
                          'passa por nós',
                      'EUA (Anthropic, OpenRouter) ou China (DeepSeek). Com o '
                          'OpenRouter, também o país da empresa do modelo',
                    ],
                    [
                      'Google (Google Fonts)',
                      'Na versão web, fornece uma fonte de símbolos. Recebe o '
                          'seu IP, sem nenhum dado de caso ou de conta',
                      'EUA',
                    ],
                  ],
                ),
              ],
            ),
            PoliticaSubsection(
              heading: '5.2 Determinação legal',
              paragraphs: [
                'Diante de ordem judicial ou requisição de autoridade '
                    'competente, só podemos entregar o que temos: os metadados '
                    'da conta e blocos encriptados que não conseguimos abrir. '
                    'Não temos a chave do seu cofre nem a sua senha.',
              ],
            ),
            PoliticaSubsection(
              heading: '5.3 Proteção de direitos',
              paragraphs: [
                'Podemos usar as informações que temos para o exercício '
                    'regular de direitos em processo judicial, administrativo '
                    'ou arbitral (art. 7º, VI).',
              ],
            ),
            PoliticaSubsection(
              heading: '5.4 Transferência do serviço',
              paragraphs: [
                'Se o Lynceu for transferido a outro responsável, os dados da '
                    'conta irão junto, com as mesmas proteções, e esta '
                    'política será atualizada antes.',
              ],
            ),
          ],
        ),
        PoliticaSection(
          heading: '6. Transferência internacional',
          inShort:
              'O servidor fica nos EUA, e a IA, no país do provedor que você '
              'escolher.',
          paragraphs: [
            'Os dados da conta e os blocos encriptados ficam em servidor da '
                'DigitalOcean em Nova York, EUA. Essa transferência é '
                'necessária para prestar o serviço de sincronização (art. 33, '
                'IX, combinado com o art. 7º, V, da LGPD). O que fica lá chega '
                'encriptado no seu aparelho ou reduzido a código (HMAC), exceto '
                'os metadados da seção 1.2 e, durante a fase de teste, a lista '
                'de e-mails autorizados a se cadastrar. O e-mail também passa '
                'pelo servidor, protegido por HTTPS, a cada cadastro e login.',
            'O texto pseudonimizado vai ao país do provedor de IA que você '
                'escolher: EUA (Anthropic, OpenRouter) ou China (DeepSeek), '
                'além do país da empresa do modelo escolhido no OpenRouter. O '
                'envio só acontece quando você confirma, na prévia que diz para '
                'onde o texto vai. Para os seus dados envolvidos '
                'nesse envio, como o IP e a chave de API, essa confirmação é o '
                'seu consentimento específico e destacado (art. 33, VIII).',
            'Na versão web, a Google, nos EUA, recebe o seu IP ao fornecer uma '
                'fonte de símbolos.',
            'Onde os dados podem ficar quando houver dados reais ainda será '
                'validado antes da fase 8.',
          ],
        ),
        PoliticaSection(
          heading: '7. Armazenamento e segurança',
          inShort:
              'Tudo é encriptado no seu aparelho antes de sair dele. Mesmo '
              'assim, nenhum sistema é 100% seguro, e o Lynceu ainda não '
              'passou por auditoria externa.',
          subsections: [
            PoliticaSubsection(
              heading: '7.1 No seu aparelho',
              bullets: [
                'Offline primeiro: os dados vivem no aparelho. Registrar, '
                    'consultar e fotografar não dependem de rede.',
                'Cofre encriptado: uma chave aleatória de 256 bits protege '
                    'todos os dados, e ela fica guardada encriptada por uma '
                    'chave derivada da sua senha (Argon2id, via libsodium). O '
                    'banco local é encriptado por inteiro (SQLite3MultipleCiphers, '
                    'ChaCha20-Poly1305).',
                'Sessão curta: o cofre bloqueia depois de 5 minutos sem uso, '
                    'ou 30 segundos com o app fora de vista.',
                'No Android, o app fica fora do backup do sistema e da '
                    'transferência entre aparelhos, e as telas são protegidas '
                    'contra captura.',
                'Na versão web, nada fica no navegador: nem cookies, nem '
                    'localStorage, nem IndexedDB. A chave e os dados ficam só '
                    'em memória, com o banco encriptado, e somem ao fechar ou '
                    'recarregar a aba. Na web só se entra em conta existente, '
                    'e o que não tiver subido se perde ao fechar a aba.',
                'Dado de caso não vai em claro para log, analytics, relatório '
                    'de falhas, rede ou disco.',
              ],
            ),
            PoliticaSubsection(
              heading: '7.2 No servidor',
              bullets: [
                'Conexão protegida por HTTPS (TLS).',
                'O servidor guarda só blocos encriptados no aparelho e não tem '
                    'a chave para abri-los.',
                'E-mail e autenticador ficam só como HMAC, e a chave '
                    'encapsulada fica dentro de um envelope AES-256-GCM, com o '
                    'segredo fora do banco: vazar só o banco não revela quem '
                    'tem conta nem permite testar senhas.',
                'O token de acesso fica guardado só como hash (SHA-256).',
                'Limite de tentativas por IP e por e-mail, teto de contas e '
                    'cota por conta.',
                'Sem registro de acesso. O servidor não registra corpo, '
                    'cabeçalho nem conta dos pedidos.',
                'Cópia de segurança diária do banco, no próprio servidor, '
                    'guardada por 14 dias. Contém o mesmo que o banco: dados '
                    'encriptados e códigos.',
              ],
            ),
            PoliticaSubsection(
              heading: '7.3 Exportação do relatório',
              bullets: [
                'O relatório em DOCX ou PDF é gerado no seu aparelho, sem '
                    'serviço externo, só por ação explícita sua e com aviso. '
                    'Você escolhe o destino; na web, é um download do '
                    'navegador. O app não guarda cópia. No iOS, a exportação '
                    'ainda está bloqueada.',
                'A exportação fica bloqueada enquanto houver variável sem '
                    'restaurar.',
                'O arquivo exportado fica fora da proteção do cofre e passa a '
                    'ser sua responsabilidade.',
              ],
            ),
            PoliticaSubsection(
              heading: '7.4 Limitações',
              paragraphs: [
                'Nenhum sistema é 100% seguro. Os limites conhecidos são:',
              ],
              bullets: [
                'Ainda não houve auditoria externa de segurança nem teste de '
                    'invasão: eles fazem parte da fase 8. A biblioteca que '
                    'encripta o banco local (SQLite3MultipleCiphers) é de '
                    'código aberto e usa primitivas padrão, mas não tem '
                    'auditoria independente publicada.',
                'O servidor vê metadados (contas, volumes e horários) e pode '
                    'omitir ou atrasar blocos, mas não alterá-los nem lê-los.',
                'Quem invadir o servidor e obtiver, ao mesmo tempo, o banco e '
                    'o segredo de login pode tentar adivinhar senhas fora dele. '
                    'Use uma senha forte: uma senha fraca abriria todos os seus '
                    'casos.',
                'Na versão web, quem controlar o servidor poderia trocar o '
                    'código servido e capturar a senha e a chave de API '
                    'digitadas. Ali, a chave do DeepSeek também fica ao '
                    'alcance do código da página.',
                'O código de recuperação equivale à chave do cofre: quem o '
                    'tiver abre seus casos, e trocar a senha não o revoga. Se '
                    'você esquecer a senha e perder o código, os dados não '
                    'podem ser recuperados, nem por nós.',
                'Com a chave de API sincronizada, quem tiver a sua senha ou o '
                    'seu código de recuperação também obtém a chave. Se ela for '
                    'comprometida, revogue-a no provedor.',
                'No iOS, o sistema não permite bloquear capturas de tela. '
                    'Teclados de terceiros podem registrar o que você digita.',
                'Um aparelho já comprometido, por exemplo por malware, pode '
                    'expor os dados abertos durante a sessão.',
                'A pseudonimização e o relatório exportado têm os limites '
                    'descritos nas seções 3.4 e 7.3.',
              ],
            ),
          ],
        ),
        PoliticaSection(
          heading: '8. Retenção e exclusão de conta',
          inShort:
              'Guardamos os dados da conta enquanto ela existir. Por enquanto, '
              'a exclusão é feita por pedido por e-mail.',
          paragraphs: [
            'Os dados da conta e os blocos e fotos encriptados ficam no '
                'servidor enquanto a conta existir. A opção "Desligar neste '
                'aparelho", em Ajustes, para a sincronização naquele aparelho, '
                'mas não apaga nada do servidor.',
            'O app ainda não tem opção para excluir a conta. Para excluí-la, '
                'escreva para o e-mail da seção 13, de preferência a partir do '
                'e-mail da conta. Podemos pedir confirmação de que o pedido é '
                'seu. Confirmado o pedido, apagamos a conta, o login, os blocos '
                'e as fotos em até 30 dias, já contando a substituição das '
                'cópias de segurança.',
            'O IP usado para limitar tentativas fica só em memória, por até '
                'uma hora.',
            'Os dados no seu aparelho ficam sob o seu controle, e não temos '
                'como acessá-los nem apagá-los à distância. Na web, eles somem '
                'ao fechar a aba.',
            'Podemos manter dados pelo tempo exigido por obrigação legal ou '
                'para o exercício regular de direitos.',
          ],
        ),
        PoliticaSection(
          heading: '9. Seus direitos (LGPD)',
          inShort:
              'Você tem os direitos do art. 18 da LGPD. Como não conseguimos '
              'ler o conteúdo dos casos, parte deles se exerce no próprio app.',
          bullets: [
            'Confirmação da existência de tratamento e acesso aos dados (art. '
                '18, I e II). Do servidor, podemos informar se há conta ligada '
                'ao seu e-mail, as datas e o volume guardado. O conteúdo você '
                'acessa no próprio app.',
            'Correção de dados incompletos, inexatos ou desatualizados (III). '
                'O conteúdo dos casos se corrige no app; o e-mail da conta, por '
                'pedido.',
            'Anonimização, bloqueio ou eliminação de dados desnecessários, '
                'excessivos ou tratados em desconformidade com a LGPD (IV).',
            'Portabilidade (V). O conteúdo está no seu aparelho, e o relatório '
                'pode ser exportado em DOCX ou PDF.',
            'Eliminação dos dados tratados com o seu consentimento (VI) e '
                'exclusão da conta, como na seção 8.',
            'Informação sobre com quem compartilhamos dados (VII), descrita na '
                'seção 5.',
            'Informação sobre a possibilidade de não consentir e suas '
                'consequências (VIII). Sem conta, o Lynceu funciona só no '
                'aparelho, sem sincronização. Sem chave de API, não há análise '
                'por IA.',
            'Revogação do consentimento (IX).',
            'Oposição a tratamento feito com base em outra hipótese legal, em '
                'caso de descumprimento da LGPD (art. 18, § 2º).',
            'Revisão de decisões tomadas unicamente com base em tratamento '
                'automatizado (art. 20). O Lynceu não toma decisões '
                'automatizadas: as sugestões da IA só valem com decisão humana.',
          ],
          subsections: [
            PoliticaSubsection(
              heading: 'Como exercer seus direitos',
              paragraphs: [
                'No app, você consulta, corrige e apaga o conteúdo dos seus '
                    'casos. Para o restante, escreva para '
                    'faccinambiental@gmail.com, de preferência a partir do '
                    'e-mail da conta. Respondemos em até 15 dias. Se não for '
                    'possível confirmar que o pedido é seu, podemos pedir '
                    'informação adicional.',
              ],
            ),
          ],
        ),
        PoliticaSection(
          heading: '10. Menores de idade',
          paragraphs: [
            'O Lynceu é uma ferramenta profissional para policiais e não se '
                'destina a menores de 18 anos. Não coletamos intencionalmente '
                'dados de crianças ou adolescentes. Se soubermos de uma conta '
                'criada por menor, ela será excluída.',
          ],
        ),
        PoliticaSection(
          heading: '11. Cookies',
          paragraphs: [
            'O Lynceu não usa cookies, nem no app nem na versão web, e não '
                'guarda nada no armazenamento do navegador. Não usamos '
                'ferramentas de rastreamento, analytics ou publicidade. Na '
                'versão web, o carregamento de uma fonte de símbolos do Google '
                '(fonts.gstatic.com) expõe o seu IP a ele.',
          ],
        ),
        PoliticaSection(
          heading: '12. Alterações nesta política',
          paragraphs: [
            'Podemos atualizar esta política, principalmente quando o Lynceu '
                'sair da fase de teste ou quando mudarem os provedores, o '
                'servidor ou os recursos. A data no topo indica a versão em '
                'vigor. Nenhum uso com dados reais será liberado antes de uma '
                'nova versão desta política.',
            'Como não guardamos o seu e-mail em claro, não conseguimos avisar '
                'todos por e-mail. Mudanças relevantes serão destacadas nesta '
                'página e, durante a fase de teste, comunicadas diretamente a '
                'quem participa dela.',
          ],
        ),
        PoliticaSection(
          heading: '13. Contato e encarregado',
          paragraphs: [
            'Controlador e encarregado pelo tratamento de dados pessoais (art. '
                '41 da LGPD):',
            'Marcos Junior Faccin\n'
                'E-mail: faccinambiental@gmail.com\n'
                'Rua Rio Grande do Norte, 1354\n'
                "Espigão d'Oeste – RO, CEP 76974-000\n"
                'Brasil',
          ],
        ),
        PoliticaSection(
          heading: '14. Autoridade Nacional de Proteção de Dados',
          paragraphs: [
            'Se entender que seus direitos não foram atendidos, você pode '
                'apresentar reclamação à Autoridade Nacional de Proteção de '
                'Dados (ANPD): www.gov.br/anpd, anpd@anpd.gov.br.',
          ],
        ),
      ],
    );
  }
}
