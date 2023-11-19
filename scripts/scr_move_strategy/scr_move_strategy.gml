// Script para estratégias de movimento.
function scr_movimento_strategy(_estrategia, _velocidade, _andando, _parado) {
    // Chama a função de estratégia, passando os parâmetros necessários.
    // Retorna o valor atualizado de '_direcao'.
    return _estrategia(_velocidade, _andando, _parado);
}
