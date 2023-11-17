// Função para trocar o personagem atual por outro objeto especificado.
function src_trocar_personagem() {
    // Mapeia os objetos pai e filho
    var _objeto_map = ds_map_create();
    ds_map_add(_objeto_map, "puss", obj_personagem);
    ds_map_add(_objeto_map, "personagem", obj_puss);

    // Obtém o próximo objeto com base no tipo especificado
    var _novo_objeto = instance_create_layer(x, y, "Instances", _objeto_map[? tipo_obj]);

    // Verifica se o novo objeto foi criado com sucesso
    if (_novo_objeto != noone) {
        // Move o novo objeto para a posição do objeto anterior
        with (_novo_objeto) {
            x = other.x;
            y = other.y;
        }
        
        // Destroi o objeto anterior
        instance_destroy();
    }

    // Limpa o mapa de objetos
    ds_map_destroy(_objeto_map);
}
