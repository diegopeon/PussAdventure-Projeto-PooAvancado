# Puss Adventure 

<img src="/assets/img_puss.jpg" alt="Imagem Logo">
<br>

## :memo: Descrição
O Puss Adventure, ou na tradução livre aventura de gato, é um projeto realizado para a matéria de POO avançado, onde foi feito para desafiar e instigar a desenvolver habilidades práticas em refatoração de código aplicando um dos 23 padrões de design do Gang of Four (GoF), que nosso caso escolhemos o Strategy, onde se aplica para permitir que o comportamento de um objeto seja alterado independentemente de sua classe.

## 🔧 Tecnologias utilizadas
As tecnologias que foram utilizadas neste projeto foram a enginne [Game Maker 2](https://gamemaker.io/pt-BR), e sua linguagem GML. Além de um programa de criação e desenho de pixel art, chamada [Aseprite](https://www.aseprite.org/).

## 🎮 Funcionalidades
O jogo possui apenas duas fases, possuindo o objetivo de atravessar o mapa cheio de inimigos até alcançar a moeda no final e caso pegue, você é transportado para outro nível.
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
Visto acima que nós passamos por dificuldades para a produção do trabalho, pois a linguagem GML não é muito tradicional em relação a orientação a objetos, por isso que venho marcar os códigos que são os mais importantes que são os scripts: scr_movimento_strategy que é responsável pela aplicação do padrão strategy, e scr_movimento_padrao onde veio as principais variáveis que foram responsáveis pelo funcionamento.

scr_movimento_padrao:
```
<// Função para controlar o movimento padrão do personagem.
function scr_movimento_padrao(){
	// Parâmetros da função:
	var _velocidade = argument0;         // Velocidade do movimento.
	var _sprite_andando = argument1;     // Sprite quando o personagem está em movimento.
	var _sprite_parado = argument2;      // Sprite quando o personagem está parado.
	
	// Atualiza a posição do personagem com base nas teclas de direção pressionadas.
	x += _velocidade * (keyboard_check(vk_right) ? 1 : 0) - _velocidade * (keyboard_check(vk_left) ? 1 : 0);
	y += _velocidade * (keyboard_check(vk_down) ? 1 : 0) - _velocidade * (keyboard_check(vk_up) ? 1 : 0);
	
	// Define o sprite do personagem com base na tecla pressionada (em movimento ou parado).
	sprite_index = (keyboard_check(vk_anykey) ? _sprite_andando : _sprite_parado);
}
>
```

scr_movimento_strategy:
```
<// Função para controlar o movimento com base em Strategy.
function scr_movimento_strategy() {
    var _estrategia = argument[0];      // Função estratégia para o movimento.
    var _velocidade = argument[1];     // Velocidade do movimento.
	var _andando = argument[2];        // Sprite quando o personagem está em movimento.
	var _parado = argument[3];          // Sprite quando o personagem está parado.
	
    // Chama a função estratégia, passando os parâmetros necessários.
    _estrategia(_velocidade, _andando, _parado);
}
>
```
E a partir destes scripts você pode utilizar em seus objetos, por exemplo:


No creat de objeto coloque:
```
<// Define a estratégia de movimento padrão.
estrategia_movimento = scr_movimento_padrao;

// Define a velocidade de movimento padrão.
velocidade_movimento = 1;

// Define o sprite quando o personagem está parado.
sprite_parado = spr_personagem1;

// Define so sprite quando o personagem está em movimento.
sprite_andando = spr_personagem1_andando;>
```
No Step do objeto coloque:
```
<scr_movimento_strategy(estrategia_movimento, velocidade_movimento, sprite_andando, sprite_parado);>
```
E pronto você trabalhou com encapsulamento em uma linguagem que não suporta isso.

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
