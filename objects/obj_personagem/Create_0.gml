// Define o tamanho da janela do jogo.
window_set_size(1280, 720);

// Inicializa a variável para armazenar a quantidade de moedas.
moeda = 0;

// Define a estratégia de movimento padrão.
estrategia_movimento = scr_movimento_padrao;

// Define a velocidade de movimento do personagem 2.
velocidade_movimento = 1.3;

// Define o sprite quando o personagem está parado.
sprite_parado = spr_personagem2;

// Define so sprite quando o personagem está em movimento.
sprite_andando = spr_personagem2_andando;

tipo_obj = "personagem";