/// @description COLISAO
if other.tomardano == true{
	var _dir = point_direction(x, y, other.x, other.y);
	other.empurrar_dir = _dir;
	other.empurrar_forca = 3;
	other.estado = scr_personagem_hit;
	other.alarm[2] = 10;
	other.alarm[3] = 180;
	
	var _inst = instance_create_layer(x, y, "Instances", obj_dano);
	_inst.alvo = other;
	_inst.dano = 1;
	
	other.tomardano = false;
	other.vida -= 1;
}






