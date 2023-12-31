# Puss Adventure 

<img src="/assets/img_puss.jpg" alt="Imagem Logo">
<br>

## :memo: Descrição
O Puss Adventure, ou na tradução livre aventura de gato, é um projeto realizado para a matéria de POO avançado, onde foi feito para desafiar e instigar a desenvolver habilidades práticas em refatoração de código aplicando um dos 23 padrões de design do Gang of Four (GoF), que nosso caso escolhemos o Strategy, onde se aplica para permitir que o comportamento de um objeto seja alterado independentemente de sua classe.

## 🔧 Tecnologias utilizadas
As tecnologias que foram utilizadas neste projeto foram a enginne [Game Maker 2](https://gamemaker.io/pt-BR), e sua linguagem GML. Além de um programa de criação e desenho de pixel art, chamada [Aseprite](https://www.aseprite.org/).

## 🎮 Funcionalidades
O jogo possui apenas 3 fases, possuindo o objetivo de atravessar o mapa cheio de inimigos até alcançar a moeda no final e caso pegue, você é transportado para outro nível.
No mais possui uma mecânica, que caso você aperte a barra de espaço você troca personagem, e que ele possui uma velocidade maior que ao do principal, ajudando a atravessar mais rápido, porém se arriscando mais em corredores cheio de inimigos. 

## 💻 Como Baixar e Utilizar a aplicação
Isso é bem simples é só seguir os seguintes passos:
1. tenha um teclado funcional, que funcione as setas além da barra de espaço
2. Você vai ate o site do [game maker 2](https://gamemaker.io/pt-BR/download), e realiza o dowload do progrma;
3. Você baixe esse repositório, e que já terá um arquivo executável do projeto; 
4. Após isso é só clicar você vai entrar na engine, e só simplesmente rode o projeto;

## 📖 Desenvolvimento do projeto:
No começo foi uma ideia que se originou a partir de dois amigos, que queriam fazer uma coisa nova, um projeto diferente, e que com o apoio do professor e de uma equipe maravilhosa, fez com que esse projeto ganhasse vida. O começo do desenvolvimento foi mais voltado a parte gráfica, onde nós fizemos o nosso personagem principal o Puss, um gato da raça Frajola, que explora uma ruína. Após a fase de gráfico, partíamos ao desenvolvimento do código, onde percebemos que seria um desafio a frente, pois a linguagem gml não é muito convidativa para a orientação a objetos, onde que ela não é uma linguagem de programação orientada a objetos no sentido tradicional,mas depois muito estudo em manuais, e em cursos, percebemos que tinha burlar essa dificuldade, que seria a partir de scripts, onde tem como simular componentes e herança. Podendo assim de fato escolher um dos tipos padrões de design do GOF, e com isto escolhemos o  Strategy, principalmente por sua flexibilidade, e Encapsulamento de Comportamentos, que por exemplo utilizamos para se referir a velocidade, e o sprite de cada personagem.

## 👨‍💻 Códigos  Importantes:
Visto acima que nós passamos por dificuldades para a produção do trabalho, pois a linguagem GML não é muito tradicional em relação a orientação a objetos, por isso que venho marcar os códigos que são os mais importantes, que podem ser vistos logo abaixo:


### Scripts:

#### [scr_interface_movimento.gml](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/scripts/scr_interface_movimento/scr_interface_movimento.gml):
```
// scr_interface_movimento.gml

// Função que executa a estratégia de movimento, passando os parâmetros necessários.
function scr_interface_movimento(_objeto, _estrategia, _velocidade, _andando, _parado) {
    _estrategia.executar(_objeto,_velocidade, _andando, _parado);
}
```
Este script do "scr_interface_movimento" atua como a interface comum(Strategy) a todas as estratégias de movimento. A função scr_interface_movimento é a operação que o contexto chama para executar a estratégia. Ele aceita uma estratégia e os parâmetros necessários para a execução do movimento. Nesse contexto, scr_interface_movimento é a "operação" comum que o contexto usa para delegar o comportamento específico de movimento.
<br>

#### [scr_movimento_padrao.gml](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/scripts/scr_movimento_padrao/scr_movimento_padrao.gml):
```
// scr_movimento_padrao

// Estratégia padrão de movimento - responde às teclas de direção para mover o objeto.
estrategia_movimento_padrao = {
    executar: function(_objeto, _velocidade, _andando, _parado) {
        // Atualiza a posição do personagem com base nas teclas de direção pressionadas.
        _objeto.x += _velocidade * (keyboard_check(vk_right) ? 1 : 0) - _velocidade * (keyboard_check(vk_left) ? 1 : 0);
        _objeto.y += _velocidade * (keyboard_check(vk_down) ? 1 : 0) - _velocidade * (keyboard_check(vk_up) ? 1 : 0);
        
        // Atualiza a escala do sprite para refletir a direção do movimento.
        if (keyboard_check(vk_left)) {
            _objeto.image_xscale = -1; // Inverte a escala horizontal se movendo para a esquerda
        } else if (keyboard_check(vk_right)) {
            _objeto.image_xscale = 1; // Mantém a escala normal se movendo para a direita
        }

        // Define o sprite do personagem com base na tecla pressionada (em movimento ou parado).
        _objeto.sprite_index = (keyboard_check(vk_anykey) ? _andando : _parado);
    }
};
```
Neste script "scr_movimento_padrao.gml", a estratégia concreta(ConcreteStrategy) é implementada para movimento padrão em resposta às teclas pressionadas que da uma direção ao objeto. A função "executar" contém a lógica específica dessa estratégia, alterando as coordenadas do objeto com base nas teclas pressionadas.
<br>
#### [src_movimento_inimigo_aleatorio.gml](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/scripts/src_movimento_inimigo_aleatorio/src_movimento_inimigo_aleatorio.gml):
```
//src_movimento_inimigo_aleatorio.gml
// Estratégia de movimento aleatório para inimigos.
estrategia_movimento_aleatorio = {
    executar: function(_objeto, _velocidade, _andando, _parado) {
        // Se ainda não tiver uma direção, escolhe uma aleatória.
        if (typeof (_objeto.direcao) == "undefined") {
            _objeto.direcao = random(360);
        }

        // Calcula a nova posição com base na direção e velocidade.
        var _novo_x = _objeto.x + lengthdir_x(_velocidade, _objeto.direcao);
        var _novo_y = _objeto.y + lengthdir_y(_velocidade, _objeto.direcao);

        // Verifica os limites da sala.
        if (_novo_x < 0 || _novo_x > room_width || _novo_y < 0 || _novo_y > room_height) {
            // Se a nova posição estiver fora dos limites, inverte a direção.
            _objeto.direcao += 180;
        }

        // Aplica o movimento.
        _objeto.x += lengthdir_x(_velocidade, _objeto.direcao);
        _objeto.y += lengthdir_y(_velocidade, _objeto.direcao);

    }
};
```
Aqui, a estratégia concreta(ConcreteStrategy) é implementada para movimento aleatório de inimigos. A função "executar" contém a lógica específica para escolher uma direção aleatória e calcular a nova posição com base nessa direção.
<br>

### Objetos:

#### obj_puss:  <img src="/assets/puss.gif" height="50px;" alt="Gif Puss"> 

##### [Evento Creat](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/objects/obj_puss/Create_0.gml):
```
// Define a estratégia de movimento inicial como padrão.
estrategia_movimento_atual = global.estrategia_movimento_padrao;
```
Este evento é considerado um contexto(context), onde pode ser visto por creferênciar a função estrategia_movimento_padrao com a estratégia atual.
<br>
##### [Evento Step](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/objects/obj_puss/Step_0.gml):
```
// Chama a função de movimento com base na estratégia atual.
scr_interface_movimento(estrategia_movimento_atual, 1, spr_personagem1_andando, spr_personagem1);
```
A função scr_interface_movimento age como uma forma de chamar o algoritmo da estratégia, passando os parâmetros necessários. Portanto, a lógica de aplicação da estratégia está centralizada nessa função.
<br>
#### obj_personagem:  <img src="/assets/personagem2.gif" height="50px;" alt="Gif Personagem"> 

##### [Evento Creat](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/objects/obj_personagem/Create_0.gml):
```
// Define a estratégia de movimento inicial como padrão.
estrategia_movimento_atual = global.estrategia_movimento_padrao;
```
Também como o obj_puss, é uma aplicação de contexto(context), onde pode ser visto por creferênciar a função estrategia_movimento_padrao com a estratégia atual.
<br>

##### [Evento Step](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/objects/obj_personagem/Step_0.gml): 
```
// Chama a função de movimento com base na estratégia padrão.
scr_interface_movimento(estrategia_movimento_padrao, 1.2, spr_personagem2_andando, spr_personagem2);
```
E igualmente ao obj_puss, chama a função scr_interface_movimento age como uma forma de chamar o algoritmo da estratégia, passando os parâmetros necessários. Portanto, a lógica de aplicação da estratégia está centralizada nessa função.
<br>
#### obj_inimigo_caveira: <img src="/assets/inimigo.gif" height="50px;" alt="Gif Puss"> 

##### [Evento Creat](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/objects/obj_inimigo_Caveira/Create_0.gml):
```
// Define a direção inicial como uma direção aleatória.
direcao = random(360);

// Define a estratégia de movimento inicial como aleatória.
estrategia_movimento_atual = global.estrategia_movimento_aleatorio;
```
Como os demais objetos, é uma aplicação de contexto(context)onde pode ser visto por creferênciar a função estrategia_movimento_padrao com a estratégia atual.
Sendo a unica diferença que aqui tambem define a sua direção inicial.  
<br>
##### [Evento Step](https://github.com/diegopeon/OJogo-PoooAvan-ado/blob/master/objects/obj_inimigo_Caveira/Step_0.gml):
```
// Chama a função de movimento com base na estratégia aleatória.
scr_interface_movimento(estrategia_movimento_atual, 2, spr_inimigo_caveira, spr_inimigo_caveira);
```
E por fim, mesmo sendo igual aos outros objetos, chama a função scr_interface_movimento age como uma forma de chamar o algoritmo da estratégia, passando os parâmetros necessários.
<br>
### ✔ Pontos Coerentes dentro do padrão strategy
- [x] **Interface Comum**: O script "scr_interface_movimento.gml" age como uma "interface" padrão para diferentes estratégias de movimento. Ele permite que objetos chamem uma estratégia específica de movimento.
- [x] **Estratégias Concretas**:Os scripts scr_movimento_padrao.gml e src_movimento_inimigo_aleatorio.gml representam "estratégias concretas" de movimento. Cada um contém uma função executar com lógica específica.
- [x] **Uso de Estratégias por Objetos**:Objetos como obj_puss, obj_personagem, e obj_inimigo_caveira têm uma "estratégia atual" e chamam a função scr_interface_movimento para executar essa estratégia.
- [x] **Uso de Estratégias Diferentes em Objetos Diferentes**: A capacidade de definir estratégias diferentes para objetos diferentes está de acordo com o padrão Strategy, permitindo flexibilidade na escolha de comportamentos específicos em tempo de execução.

### 😢 Pontos que não foram possiveis serem aplicados:
É importante reconhecer que GML não é uma linguagem fortemente orientada a objetos. Aqui estão alguns pontos que podem não ser totalmente conformes ao padrão Strategy devido às limitações da linguagem GML:
<br>
- **Falta de Classes Abstratas e Interfaces Formais:** No GML, não há suporte explícito para classes abstratas ou interfaces. Portanto, a definição formal de uma interface comum (como no sentido estrito da programação orientada a objetos) não é possível. Mas no código está utilizando uma abordagem funcional para isso, definindo uma função comum (scr_interface_movimento) que atua como a "interface".

- **Herança Limitada:** O GML não suporta herança de classes no sentido tradicional. Os objetos no GML são mais como recipientes para scripts e eventos do que classes com herança. Isso significa que a relação de herança comum em linguagens orientadas a objetos não é totalmente reproduzida.
  
- **Encapsulamento Limitado:** A ideia de encapsulamento é limitada no GML. As variáveis e funções em scripts são frequentemente globais ou pertencem ao escopo do objeto. A encapsulação estrita de dados e métodos não é facilmente alcançada. E isso pode ser visto no creat dos objetos onde chamam a estratégia atual a partir de referência global de seus respectivos ConcreatStrategy.
  
- **Falta de Polimorfismo Formal:** O polimorfismo é mais difícil de alcançar no GML devido à falta de tipos de dados formalmente definidos e interfaces. Porém no código, o polimorfismo é alcançado funcionalmente, mas sem a formalidade e a segurança de tipos que podem ser encontradas em linguagens orientadas a objetos.
<br>

## 🤝 Colaboradores
<table>
  <tr>
    <td align="center">
      <a href="https://github.com/diegopeon">
        <img src="https://avatars.githubusercontent.com/u/105292015?v=4" width="100px;" alt="Foto de Diego Peon no GitHub"/><br>
        <sub>
          <b>Diego Peon</b>
        </sub>
      </a>
    </td>
 <td align="center">
      <a href="https://github.com/IsabelleCarvallho">
        <img src="https://avatars.githubusercontent.com/u/110946274?v=4" width="100px;" alt="Foto de Issabelle no GitHub"/><br>
        <sub>
          <b>Isabelle Carvallho</b>
        </sub>
      </a>
    </td>
     <td align="center">
      <a href="https://github.com/JeffCha">
        <img src="https://avatars.githubusercontent.com/u/128381317?v=4" width="100px;" alt="Foto de Jeferson Moraes no GitHub"/><br>
        <sub>
          <b>Jeferson Moraes</b>
        </sub>
      </a>
    </td>
     <td align="center">
      <a href="https://github.com/ofmpaz">
        <img src="https://avatars.githubusercontent.com/u/102066058?v=4" width="100px;" alt="Foto de Maria Andrade no GitHub"/><br>
        <sub>
          <b>Maria Andrade</b>
        </sub>
      </a>
    </td>
     <td align="center">
      <a href="https://github.com/mariojp">
        <img src="https://avatars.githubusercontent.com/u/554178?v=4" width="100px;" alt="Foto de Mario Jorge no GitHub"/><br>
        <sub>
          <b>Mario Jorge</b>
        </sub>
      </a>
    </td>
     <td align="center">
      <a href="https://github.com/Nelson-Afonso404">
        <img src="https://avatars.githubusercontent.com/u/89821484?v=4" width="100px;" alt="Foto de Nelson Afonso no GitHub"/><br>
        <sub>
          <b>Nelson Afonso</b>
        </sub>
      </a>
    </td>
  </tr>
</table>

<br>

<img src="/assets/puss.gif" alt="Gif Puss"> <img src="/assets/personagem2.gif" alt="Gif Personagem Sem Nome"> 
