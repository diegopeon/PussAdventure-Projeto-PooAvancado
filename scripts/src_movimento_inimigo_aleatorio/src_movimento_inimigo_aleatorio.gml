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