//Movimentando o personagem:
var _velocidade = 0.5;

x += _velocidade * (keyboard_check(vk_right) ? 1 : -1);
y += _velocidade * (keyboard_check(vk_down) ? 1 : -1);
x -= _velocidade * (keyboard_check(vk_left) ? 1 : -1);
y -= _velocidade * (keyboard_check(vk_up) ? 1 : -1);

if moeda = 1 { room_goto_next() }

sprite_index = (keyboard_check(vk_anykey) ? spr_personagem1_andando : spr_personagem1);
