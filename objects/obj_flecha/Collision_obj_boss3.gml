/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _dano = 1;
var _dir = point_direction(x,y,other.x, other.y);

other.hit = true;
other.alarm[1] = 5;
other.vida -= _dano;
obj_personagem.puxar = false;

instance_destroy();








