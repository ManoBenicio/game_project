/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if !instance_exists(obj_name_boss){

var _escala = 3;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_vida) * _escala;
var _huda = _guia - _spra;

var _vida = obj_personagem.vida;
var _maxvida = obj_personagem.max_vida;

var _estamina = obj_personagem.estamina;
var _maxestamina = obj_personagem.max_estamina;

//HUD

draw_set_font(fnt_dano);
draw_sprite_ext(spr_hud_vida, 0, 0, _huda, _escala, _escala, 0, c_white, 1);

//Barra da vida
draw_set_font(fnt_dano);
draw_sprite_ext(spr_hud_barra_vida, 0, 0, _huda, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1);

//Barra da stamina
draw_set_font(fnt_dano);
draw_sprite_ext(spr_hud_barra_estamina, 0, 0, _huda + 24, (_estamina/_maxestamina) * _escala, _escala, 0, c_white, 1);

draw_text(55, (_huda + 15), string(obj_personagem.estamina) + "/100");
draw_text(75,(_huda - 10),string(obj_personagem.vida) + "/5");

//Barra do boss
var _gl = display_get_gui_width();

if instance_exists(obj_boss){
	

	var _sprw = sprite_get_width(spr_boss_hud) * _escala;
	
	draw_sprite_ext(spr_boss_hud, 0, _gl/2 - _sprw/2, 100, _escala, _escala, 0, c_white, 1);
	draw_sprite_ext(spr_boss_vida, 0, _gl/2 - _sprw/2 + 6, 100, obj_boss.vida/obj_boss.vida_max *_escala, _escala, 0, c_white, 1);
	
}

if instance_exists(obj_boss2fase){
	

	var _sprw = sprite_get_width(spr_boss_hud) * _escala;
	
	draw_sprite_ext(spr_boss_hud, 0, _gl/2 - _sprw/2, 100, _escala, _escala, 0, c_white, 1);
	draw_sprite_ext(spr_boss_vida, 0, _gl/2 - _sprw/2 + 6, 100, obj_boss2fase.vida/obj_boss2fase.vida_max *_escala, _escala, 0, c_white, 1);
	
}

if instance_exists(obj_boss3){
	

	var _sprw = sprite_get_width(spr_boss_hud) * _escala;
	
	draw_sprite_ext(spr_boss_hud, 0, _gl/2 - _sprw/2, 100, _escala, _escala, 0, c_white, 1);
	draw_sprite_ext(spr_boss_vida, 0, _gl/2 - _sprw/2 + 6, 100, obj_boss3.vida/obj_boss3 .vida_max *_escala, _escala, 0, c_white, 1);
	draw_text( _gl/2, 150, "Reaper");
}
}







