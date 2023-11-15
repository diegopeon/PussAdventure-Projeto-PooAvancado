//Realizando o movimentação do personagem:

//se apertar na ceta para cima do teclado, move para cima
if keyboard_check(vk_up)
{
    y-=1
}

//se apertar na ceta para baixo do teclado, move para baixo
if keyboard_check(vk_down)
{
    y+=1
}

//se apertar na ceta da esquerda do teclado, move para esquerda
if keyboard_check(vk_left)
{
    x-=1 image_xscale=-1
}

if keyboard_check(vk_right)
{
    x+=1 image_xscale=1
}

if moeda=1
{
	room_goto_next()
}
	

//Se qualquer tecla for apertada, muda o sprite para o sprite de andando do personagem,
//se não ele ficar parado, ele fica sem animação

if keyboard_check(vk_anykey)
{
    sprite_index = spr_personagem1_andando
}
else
{
    sprite_index = spr_personagem1
}




