/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
script_execute(estado);

depth = -y;

if (vida <= 0){
	instance_destroy();
	instance_create_layer(x,y,"Instances",obj_boss2fase);
	audio_play_sound(msc_boss_fight2, 1, 1);
}









