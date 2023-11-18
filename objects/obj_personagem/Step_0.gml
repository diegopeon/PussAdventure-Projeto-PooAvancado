// Chama a função de movimento com base na strategy
scr_movimento_strategy(scr_movimento_padrao, 1.2, spr_personagem2_andando, spr_personagem2);

// Verifica se a quantidade de moedas, se for igual a 1, passa para outra room(nivel).
if (moeda == 1) {
    room_goto_next();
}

//caso aperte espaço, roda o script de mudar o personagem
if (keyboard_check_pressed(vk_space)) {
    src_trocar_personagem();
}
