// Script para estratégias de movimento.
estrategia_movimento_aleatorio = {
    executar: function(_objeto, _velocidade, _andando, _parado) {
        // Se ainda não tiver uma direção, escolhe uma aleatória.
        if (typeof (_objeto.direcao) == "undefined") {
            _objeto.direcao = random(360);
        }

        // Calcula a nova posição com base na direção e velocidade.
        var novo_x = _objeto.x + lengthdir_x(_velocidade, _objeto.direcao);
        var novo_y = _objeto.y + lengthdir_y(_velocidade, _objeto.direcao);

        // Verifica os limites da sala.
        if (novo_x < 0 || novo_x > room_width || novo_y < 0 || novo_y > room_height) {
            // Se a nova posição estiver fora dos limites, inverte a direção.
            _objeto.direcao += 180;
        }

        // Aplica o movimento.
        _objeto.x += lengthdir_x(_velocidade, _objeto.direcao);
        _objeto.y += lengthdir_y(_velocidade, _objeto.direcao);

        // Retorna o resultado do movimento.
        return _objeto.direcao;
    }
};
