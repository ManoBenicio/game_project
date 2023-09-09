/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

	var _guil = display_get_gui_width();
	var _guia = display_get_gui_height();

	var _xx = 0;
	var _yy = 0;
	var _c = c_white;

	draw_set_font(fnt_nome_boss);
	
	if alarm[0] == 120 {
		audio_play_sound(msc_boss_fight3,1,1);
	}
	
	
	draw_rectangle_color(_xx, _yy, _guil, _guia, _c, _c, _c, _c, false);
	draw_text_color(_guil / 2, _guia/2, "REAPER",c_black,c_black,c_black,c_black,1);
	
	if alarm[0] <= 0{
		instance_destroy();	
	}




