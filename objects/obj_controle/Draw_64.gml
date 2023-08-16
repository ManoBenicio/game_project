/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _escala = 3;
var _guia = display_get_gui_height();
var _spra = sprite_get_height(spr_hud_vida) * _escala;
var _huda = _guia - _spra;

var _vida = obj_personagem.vida;
var _maxvida = obj_personagem.max_vida;

var _estamina = obj_personagem.estamina;
var _maxestamina = obj_personagem.max_estamina;

//HUD

draw_sprite_ext(spr_hud_vida, 0, 0, _huda, _escala, _escala, 0, c_white, 1);

//Barra da vida

draw_sprite_ext(spr_hud_barra_vida, 0, 0, _huda, (_vida/_maxvida) * _escala, _escala, 0, c_white, 1);

//Barra da stamina

draw_sprite_ext(spr_hud_barra_estamina, 0, 0, _huda + 24, (_estamina/_maxestamina) * _escala, _escala, 0, c_white, 1);

draw_text(55, (_huda + 15), string(obj_personagem.estamina) + "/100");
draw_text(75,(_huda - 10),string(obj_personagem.vida) + "/5");







