// Função para controlar o movimento padrão do personagem.
function scr_movimento_padrao(_velocidade, _andando, _parado){
	// Atualiza a posição do personagem com base nas teclas de direção pressionadas.
	x += _velocidade * (keyboard_check(vk_right) ? 1 : 0) - _velocidade * (keyboard_check(vk_left) ? 1 : 0);
	y += _velocidade * (keyboard_check(vk_down) ? 1 : 0) - _velocidade * (keyboard_check(vk_up) ? 1 : 0);
	
	// Define o sprite do personagem com base na tecla pressionada (em movimento ou parado).
	sprite_index = (keyboard_check(vk_anykey) ? _andando : _parado);
}
