// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_boss3_nascendo(){
	image_speed = 1;
	sprite_index = spr_nascendo_boss3; // Define o sprite atual
	
	var treme = instance_create_layer(x,y, "Instances", obj_treme);
	
	if image_index <= 14{	
		treme.treme = 15;
	}else{
		treme.treme = 50;
	}
	
	camera.x = lerp(x, obj_boss3. x, 0.05);
	camera.y = lerp(y, obj_boss3. y, 0.05);
	if fim_da_animacao(){
		estado = scr_boss3_perseguindo;
		instance_create_layer(x,y, "Instances", obj_name_boss);
	}
}

function scr_boss3_colisao(){
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
	
function scr_boss3_perseguindo(){

	if ataque == false{
		image_speed = 1;
		sprite_index = spr_andar_boss3;
	
		dest_x = obj_personagem.x;
		dest_y = obj_personagem.y;
	
		var _dir = point_direction(x, y, dest_x, dest_y);
		hveloc = lengthdir_x(veloc_perseg, _dir);
		vveloc = lengthdir_y(veloc_perseg, _dir);
	
		scr_boss3_colisao();
	
		var distance;
		distance = point_distance(obj_personagem.x, obj_personagem.y, obj_boss3.x, obj_boss3.y);

		if (distance < 100 && alarm[0] <= 0 && image_index <= 1) {
		    estado = scr_boss3_ataque;
		}
		
		if alarm[2] <= 0 && image_index <= 1{
			estado = scr_boss3_ataque2;
		}
		
	}
	
}

function scr_boss3_ataque(){
	ataque = true;
	image_speed = 1;
	if (obj_boss3.x > obj_personagem.x){
		dir = 0;	
	}else{
		dir = 1;
	}
	
	if alarm[0] <= 0{
		
		sprite_index = spr_ataque_boss3;
		
		if image_index >= 5{
			switch dir{
				default:
					instance_create_layer(x - 75, y, "Instances", obj_hit_box_boss3);
				break;
				case 1:
					instance_create_layer(x + 75, y, "Instances", obj_hit_box_boss3);
				break;
				}
			
		}
		
		if (fim_da_animacao()){
		estado = scr_boss3_perseguindo;
		alarm[0] = 240;
		ataque = false;
		}
	}
	
	
}

function scr_boss3_ataque2(){
	sprite_index = spr_cast_boss3;
	
	if fim_da_animacao(){
		repeat(10){
			var _xx = irandom_range(x-200, x+200);
			var _yy = irandom_range(y-200, y+200);
		
			instance_create_layer(_xx, _yy, "Instances", obj_boss3_ataque2);
		}
	}
	
	if (fim_da_animacao()){
		estado = scr_boss3_perseguindo;
		alarm[2] = 360;
		ataque = false;
		}	
}

function scr_boss3_morrendo(){
	image_speed = 0.8;
	sprite_index = spr_morte_boss3;
	
	if fim_da_animacao(){
		instance_destroy();	
	}
	
	audio_pause_sound(msc_boss_fight3);
}

function scr_boss3_hit(){
	empurrar_veloc = lerp(empurrar_veloc, 0, 0.05);
	
	hveloc = lengthdir_x(empurrar_veloc, empurrar_dir);
	vveloc = lengthdir_y(empurrar_veloc, empurrar_dir);
	
	scr_boss3_colisao();
}