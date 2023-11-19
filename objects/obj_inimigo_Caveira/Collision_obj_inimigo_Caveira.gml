// Evento de Colisão entre obj_inimigo_caveira e obj_barreira
if (place_meeting(x, y, obj_barreira))
{
    // Inverte a direção do movimento
    hsp = -hsp;
    vsp = -vsp;
}








