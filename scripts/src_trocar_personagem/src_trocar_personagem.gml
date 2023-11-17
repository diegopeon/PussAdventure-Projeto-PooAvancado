// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function src_trocar_personagem(){
	/// trocarObjeto()

// Mapeia os objetos pai e filho
var _objeto_map = ds_map_create();
ds_map_add(_objeto_map, "puss", obj_personagem);
ds_map_add(_objeto_map, "personagem", obj_puss);

// Obtém o próximo objeto
var _novo_objeto = instance_create_layer(x, y, "Instances", _objeto_map[? tipo_obj]);

if (_novo_objeto != noone) {
    with (_novo_objeto) {
        x = other.x;
        y = other.y;
    }
    instance_destroy();
}

// Limpa o mapa
ds_map_destroy(_objeto_map);

}