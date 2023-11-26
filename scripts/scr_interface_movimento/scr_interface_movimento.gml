// scr_interface_movimento.gml

function scr_interface_movimento(_objeto, _estrategia, _velocidade, _andando, _parado) {
    _estrategia.executar(_objeto, _velocidade, _andando, _parado);
}
