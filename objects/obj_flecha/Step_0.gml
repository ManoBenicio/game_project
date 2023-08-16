/// @description Inserir descrição aqui
var _inst = instance_create_layer(x,y, "Instances", obj_flecha_efeito);
_inst.sprite_index = sprite_index;
_inst.image_angle = image_angle;

var maxDistance = obj_personagem.forca; // Por exemplo, 100 pixels

// Calcule a distância entre a posição inicial e a posição atual do objeto
var distanceTraveled = point_distance(x, y, xstart, ystart);

// Verifique se a distância percorrida é maior do que a distância máxima permitida
if (distanceTraveled > maxDistance) {
    speed = 0;
}






