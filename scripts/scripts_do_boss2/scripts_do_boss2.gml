// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_boss2_nascendo(){
	image_speed = 1;
	sprite_index = spr_demon_alive; // Define o sprite atual
	
	camera.x = lerp(x, obj_boss2fase. x, 0.05);
	camera.y = lerp(y, obj_boss2fase. y, 0.05);
	if fim_da_animacao(){
		estado = scr_boss2_perseguindo;
	}
}

function scr_boss2_colisao(){
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
	
function scr_boss2_perseguindo(){

	if ataque == false{
		image_speed = 1;
		sprite_index = spr_demon_walk;
	
		dest_x = obj_personagem.x;
		dest_y = obj_personagem.y;
	
		var _dir = point_direction(x, y, dest_x, dest_y);
		hveloc = lengthdir_x(veloc_perseg, _dir);
		vveloc = lengthdir_y(veloc_perseg, _dir);
	
		scr_boss2_colisao();
	
		var distance;
		distance = point_distance(obj_personagem.x, obj_personagem.y, obj_boss2fase.x, obj_boss2fase.y);

		if (distance < 100 && alarm[0] <= 0) {
		    estado = scr_boss2_ataque;
		}
	}
	
}

function scr_boss2_ataque(){
	
	ataque = true;
	image_speed = 2;
	if (obj_boss2fase.x > obj_personagem.x){
		dir = 0;	
	}else{
		dir = 1;
	}
	
	if alarm[0] <= 0{
		sprite_index = spr_demon_ataque;
		
		if image_index >= 10{
			switch dir{
				default:
					instance_create_layer(x - 75, y, "Instances", obj_hit_box_boss2);
				break;
				case 1:
					instance_create_layer(x + 75, y, "Instances", obj_hit_box_boss2);
				break;
				}
			
		}
		
		if (fim_da_animacao()){
		estado = scr_boss2_perseguindo;
		alarm[0] = 240;
		ataque = false;
		}
	}
	
	
}

function scr_boss2_morrendo(){
	image_speed = 0.8;
	sprite_index = spr_demon_death;
	
	if fim_da_animacao(){
		instance_destroy();	
	}
	
	audio_pause_sound(msc_boss_fight3);
}

function scr_boss2_hit(){
	empurrar_veloc = lerp(empurrar_veloc, 0, 0.05);
	
	hveloc = lengthdir_x(empurrar_veloc, empurrar_dir);
	vveloc = lengthdir_y(empurrar_veloc, empurrar_dir);
	
	scr_boss2_colisao();
}