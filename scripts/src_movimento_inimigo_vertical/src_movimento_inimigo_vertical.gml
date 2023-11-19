function src_movimento_inimigo_vertical(_velocidade, _andando, _parado){
	
	y += _velocidade;
	
	// Adicione alguma aleatoriedade à movimentação lateral.
    x += choose(-1, 0, 1) * irandom_range(1, 3);
    
    // Defina o sprite do inimigo com base no movimento.
    sprite_index = (_velocidade != 0 ? _andando : _parado);
	

}