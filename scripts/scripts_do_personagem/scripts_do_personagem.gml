// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_personagem_colisao(){
	if place_meeting(x + hveloc,y, obj_parede){
		while !place_meeting(x+sign(hveloc), y, obj_parede){
			x += sign(hveloc);
		}
	
		hveloc = 0;
	}

	x += hveloc;

	if place_meeting(x,y + vveloc, obj_parede){
		while !place_meeting(x, y+sign(vveloc), obj_parede){
			y += sign(vveloc);
		}
	
		vveloc = 0;
	}

	y += vveloc;	
}

function scr_personagem_andando(){
	// MOVIMENTAÇÃO
	
	
	
	direita = keyboard_check(ord("D"));
	cima = keyboard_check(ord("W"));
	esquerda = keyboard_check(ord("A"));
	baixo = keyboard_check(ord("S"));

	hveloc = (direita - esquerda);
	vveloc = (baixo - cima);
	
	veloc_dir = point_direction(x, y, x+hveloc, y+vveloc);
	
	if (hveloc != 0 or vveloc != 0){
		veloc = 2;
	}else{
		veloc = 0;
	}
	
	hveloc = lengthdir_x(veloc, veloc_dir);
	vveloc = lengthdir_y(veloc, veloc_dir);
	
	scr_personagem_colisao();

	//Mudar sprites

	dir = floor((point_direction(x, y, mouse_x, mouse_y)+45)/90);

	if (hveloc == 0 && vveloc == 0){
		switch dir{
			default:
				sprite_index = spr_personagem_parado_direita;
			break;
			case 1:
				sprite_index = spr_personagem_parado_cima;
			break;
			case 2:
				sprite_index = spr_personagem_parado_esquerda;
			break;
			case 3:
				sprite_index = spr_personagem_parado_baixo;
			break;
		}
	}else{
		switch dir{
			default:
				sprite_index = spr_personagem_correndo_direita;
				if alarm[4] <= 0{
				audio_play_sound(som_andar, 0, 0);
				alarm[4] = 25;
				}
			break;
			case 1:
				sprite_index = spr_personagem_correndo_cima;
				if alarm[4] <= 0{
				audio_play_sound(som_andar, 0, 0);
				alarm[4] = 25;
				}
			break;
			case 2:
				sprite_index = spr_personagem_correndo_esquerda;
				if alarm[4] <= 0{
				audio_play_sound(som_andar, 0, 0);
				alarm[4] = 25;
				}
			break;
			case 3:
				sprite_index = spr_personagem_correndo_baixo;
				if alarm[4] <= 0{
				audio_play_sound(som_andar, 0, 0);
				alarm[4] = 25;
				}
			break;
		}
	}
	
	if estamina >= 10{
		if mouse_check_button_pressed(mb_right){
			estamina -= 10; 
			alarm[1] = 180;
			
			alarm[0] = 8;
			dash_dir = point_direction(x,y, mouse_x, mouse_y);
			estado = scr_personagem_dash;
		}
	}
	
	// ATACANDO 
	
	if mouse_check_button_pressed(mb_left){
		if arma == Armas.Espada{
			image_index = 0;
		
			switch dir{
				default:
					sprite_index = spr_personagem_atacando_direita;
				break;
				case 1:
					sprite_index = spr_personagem_atacando_cima;
				break;
				case 2:
					sprite_index = spr_personagem_atacando_esquerda;
				break;
				case 3:
					sprite_index = spr_personagem_atacando_baixo;
				break;
			}
		
			estado = scr_personagem_atacando;
		}else if arma == Armas.Arco{
			image_index = 0;
			
			estado = scr_personagem_arco
		}
	}
}

// DASH

function scr_personagem_dash(){
	
	if alarm[5] <= 0{
	audio_play_sound(som_dashh, 0, 0);
	alarm[5] = 15;
	}
	
	tomardano = false;
	
	hveloc = lengthdir_x(dash_veloc, dash_dir);
	vveloc = lengthdir_y(dash_veloc, dash_dir);
	
	scr_personagem_colisao();
	
	var _inst = instance_create_layer(x,y,"Instances", obj_dash);
	_inst.sprite_index = sprite_index;
	
}

//ATACANDO

function scr_personagem_atacando(){
	if image_index == 1 {
		audio_play_sound(som_atacar, 0, 0);	
	}
	if image_index >= 1{
		if atacar == false {
			switch dir{
				default:
					instance_create_layer(x + 10, y, "Instances", obj_personagem_hitbox);
				break;
				case 1:
					instance_create_layer(x, y - 10, "Instances", obj_personagem_hitbox);
				break;
				case 2:
					instance_create_layer(x - 10, y, "Instances", obj_personagem_hitbox);
				break;
				case 3:
					instance_create_layer(x, y + 10, "Instances", obj_personagem_hitbox);
				break;
			}
			atacar = true;
		}
	}
	
	if fim_da_animacao(){
		estado = scr_personagem_andando;	
		atacar = false;
	}
}

function scr_personagem_hit(){
	if alarm[2] > 0{
		
		hveloc = lengthdir_x(empurrar_forca, empurrar_dir);
		vveloc = lengthdir_y(empurrar_forca, empurrar_dir);
	
		scr_personagem_colisao();
	}else{
		estado = scr_personagem_andando;	
	}
}

function scr_personagem_arco(){
	dir = floor((point_direction(x, y, mouse_x, mouse_y)+45)/90);
	
	switch dir{
		default:
			sprite_index = spr_personagem_arco_direita;
		break;
		case 1:
			sprite_index = spr_personagem_arco_cima;
		break;
		case 2:
			sprite_index = spr_personagem_arco_esquerda;
		break;
		case 3:
			sprite_index = spr_personagem_arco_baixo;
		break;
	}
	
	if fim_da_animacao(){
		image_index	= 4;
	}
	
	if mouse_check_button_released(mb_left){

		if puxar == false{
			
			if image_index >= 0 && image_index < 1{
			forca = 20;
		}else if image_index >= 1 && image_index < 2{
			forca = 60;
		}else if image_index >= 2 && image_index < 3{
			forca = 100;
		}else if image_index >= 3 && image_index < 4{
			forca = 140;
		}else if image_index >= 4 && image_index < 5{
			forca = 180;
		}else if image_index >= 5 && image_index <=6{
			forca = 220;
		}
					var _dir = point_direction(x, y, mouse_x, mouse_y);
					var _xx = lengthdir_x(5, _dir);
					var _yy = lengthdir_y(5, _dir);
				
					var _inst = instance_create_layer(x + _xx, y + _yy, "Instances", obj_flecha);
					_inst.direction = _dir;
					_inst.image_angle = _dir; 
					_inst.speed = 6;
				
					estado = scr_personagem_andando;
					
					puxar = true;	
		}else{
			if(instance_exists(obj_flecha)){
				puxar = false;
				forca = 280;
			
				var _dir = point_direction(obj_flecha.x, obj_flecha.y, obj_personagem.x ,obj_personagem.y);
				obj_flecha.direction = _dir;
				obj_flecha.image_angle = _dir; 
				obj_flecha.speed = 25;
			
				estado = scr_personagem_andando;
			}
		}
	}
}