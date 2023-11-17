// Função para controlar o movimento com base em Strategy.
function scr_movimento_strategy() {
    var _estrategia = argument[0];      // Função estratégia para o movimento.
    var _velocidade = argument[1];     // Velocidade do movimento.
	var _andando = argument[2];        // Sprite quando o personagem está em movimento.
	var _parado = argument[3];          // Sprite quando o personagem está parado.
	
    // Chama a função estratégia, passando os parâmetros necessários.
    _estrategia(_velocidade, _andando, _parado);
}
