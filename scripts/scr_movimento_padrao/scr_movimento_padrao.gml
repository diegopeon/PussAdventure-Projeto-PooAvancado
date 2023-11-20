// Script para estratégias de movimento.
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
