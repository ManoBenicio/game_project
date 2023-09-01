// Os recursos de script mudaram para a v2.3.0; veja
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para obter mais informações
function scr_boss_escolher_ataque(){
	if alarm[0] <= 0{
		var _ataque = choose(scr_boss_ataque1, scr_boss_ataque2);
		estado = _ataque;
		alarm[0] = 240;
	}
}

function scr_boss_ataque1(){
	var _dir = 0;
	
	repeat(8){
		var _inst = instance_create_layer(x, y, "Instances", obj_boss_projetil);
		_inst.speed = 2;
		_inst.direction = _dir;
		
		_dir += 45;
	}
	
	estado = scr_boss_escolher_ataque;
}

function scr_boss_ataque2(){
	repeat(6){
		var _xx = irandom_range(x-100, x+100);
		var _yy = irandom_range(y-100, y+100);
		
		instance_create_layer(_xx, _yy, "Instances", obj_boss_ataque1);
	}
	
	estado = scr_boss_escolher_ataque;
}