**Atividade 2.
Qual a diferença entre Expandido e Flexível? O que acontece quando dois elementos na mesma Linha ou Coluna têm valores de flex diferentes?

Expandido: Obriga o elemento filho a preencher todo o espaço disponível. Flexível: Permite que o elemento filho ocupe apenas o tamanho necessário do seu próprio conteúdo. Ele define um teto, mas não força o componente a esticar.

Elementos com valores diferentes, o espaço restante é distribuído de forma proporcional à soma dos valores.
____________________________________________________________________
**Atividade 3.
Pesquisa e implementação de Widgets no aplicativo

*A) Pesquisa: quais propriedades do ListTile posicionam cada elemento?
-ListTile:
-leading: widget à esquerda (geralmente um ícone ou avatar).
-title: texto principal, no centro, em cima.
-subtitle: texto secundário, no centro, abaixo do título.
-trailing: widget à direita (ex.: seta).

*B) O GridView dentro do ListView gera erro de altura. Pesquise shrinkWrap e physics (com NeverScrollableScrollPhysics()) e entenda por que resolvem.

-O ListView dá altura infinita aos filhos, e o GridView também tenta ocupar altura infinita, então o Flutter não consegue calcular o tamanho e dá erro.

-shrinkWrap: true: o GridView ocupa só a altura do conteúdo.
physics: NeverScrollableScrollPhysics(): desliga a rolagem do GridView, para só o ListView rolar.


*C) Pesquise: o que fazem left, right, top e bottom? 

-Definem a distância do filho até cada borda do Stack. left: 12, bottom: 12 coloca o texto a 12 pixels da borda esquerda e a 12 da borda de baixo, ou seja, no canto inferior esquerdo.

*Em que ordem o Stack desenha os filhos?

-O primeiro filho da lista é desenhado no fundo, e cada filho seguinte fica por cima do anterior.

*Table
________________________________________________________________
Widget | Para que serve | 2 propriedades usadas e o que fazem | link da documentação | | | || |Cartão | Caixa que agrupa conteúdo, com sombra e cantos fechados | criança:o conteúdo dentro do cartão / elevação: tamanho da sombra | https://api.flutter.dev/flutter/material/Card-class.html| | | || |ListTile |Linha com ícone, título e subtítulo |leading: widget à esquerda / trailing: widget à direita | https://api.flutter.dev/flutter/material/ListTile-class.html | | | || |GridView.contagem | Grade com número fixo de colunas | crossAxisCount: quantas colunas / shrinkWrap: ocupa só a altura necessária | https://api.flutter.dev/flutter/widgets/GridView-class.html | | | || |Pilha | Coloca widgets um sobre o outro | filhos:os widgets empilhados / alinhamento:posição dos filhos sem Posicionado | https://api.flutter.dev/flutter/widgets/Stack-class.html | | | || |Posicionado | Posiciona um widget dentro do Stack | esquerda-direita: distância das laterais / superior-inferior: distância de cima e de baixo | https://api.flutter.dev/flutter/widgets/Positioned-class.html | | | || |Embrulhar | Organiza widgets em linha e quebra para a próxima quando falta espaço | espaçamento: espaço entre itens / runSpacing: espaço entre as linhas | https://api.flutter.dev/flutter/widgets/Wrap-class.html | | | || |Ficha | Etiqueta pequena com texto| label: o texto /avatar: ícone antes do texto | https://api.flutter.dev/flutter/material/Chip-class.html | | | ____________ | |
____________________________________________________________________

*Qual a diferença entre Row/Column e Stack?
*Quando usar cada um?

Row e Column organizam os filhos em sequência, um ao lado do outro ou um embaixo do outro. Stack empilha os filhos um sobre o outro, e o Positioned define onde cada um fica. Row/Column para listas e Stack para sobrepor, como texto sobre imagem.