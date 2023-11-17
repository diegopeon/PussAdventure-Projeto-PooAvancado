// Função para controlar o movimento padrão do personagem.
function scr_movimento_padrao(){
	// Parâmetros da função:
	var _velocidade = argument0;         // Velocidade do movimento.
	var _sprite_andando = argument1;     // Sprite quando o personagem está em movimento.
	var _sprite_parado = argument2;      // Sprite quando o personagem está parado.
	
	// Atualiza a posição do personagem com base nas teclas de direção pressionadas.
	x += _velocidade * (keyboard_check(vk_right) ? 1 : 0) - _velocidade * (keyboard_check(vk_left) ? 1 : 0);
	y += _velocidade * (keyboard_check(vk_down) ? 1 : 0) - _velocidade * (keyboard_check(vk_up) ? 1 : 0);
	
	// Define o sprite do personagem com base na tecla pressionada (em movimento ou parado).
	sprite_index = (keyboard_check(vk_anykey) ? _sprite_andando : _sprite_parado);
}
