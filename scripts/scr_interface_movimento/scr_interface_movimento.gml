// scr_interface_movimento.gml

// Função que executa a estratégia de movimento, passando os parâmetros necessários.
function scr_interface_movimento(_objeto, _estrategia, _velocidade, _andando, _parado) {
    _estrategia.executar(_objeto,_velocidade, _andando, _parado);
}
