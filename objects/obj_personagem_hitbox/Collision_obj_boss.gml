/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

other.vida -= obj_personagem.dano;

other.alarm[1] = 5;
other.hit = true;

var _inst = instance_create_layer(x, y, "Instances", obj_dano);
_inst.alvo = other;
_inst.dano = obj_personagem.dano;










