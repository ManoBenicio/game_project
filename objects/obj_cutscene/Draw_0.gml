/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _videoData = video_draw();
var _videoStatus = _videoData[0];

var _guil = display_get_gui_width();
var _guia = display_get_gui_height();

if (_videoStatus == 0){
	
	draw_surface(_videoData[1], 0, 0);

}

if alarm[0] == 0{
	instance_create_layer(0,0,"Instances",obj_menu);	
}







