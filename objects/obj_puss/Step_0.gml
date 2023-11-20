// Chama a função de movimento com base na estratégia atual.
scr_interface_movimento(estrategia_movimento_atual, 1, spr_personagem1_andando, spr_personagem1);

// Verifica se a tecla de espaço foi pressionada, e se sim, executa o script de trocar o personagem.
if (keyboard_check_pressed(vk_space)) {
    src_trocar_personagem();
}

// Verifica se a quantidade de moedas é igual a 1, e se sim, avança para a próxima sala (nível).
if (moeda == 1) {
    room_goto_next();
}