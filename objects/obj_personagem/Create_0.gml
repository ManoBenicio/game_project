/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

enum Armas{
	Espada = 0,
	Arco = 1,
	Altura = 2
}

//MOVIMENTAÇÃO

direita = -1;
cima = -1;
esquerda = -1;
baixo = -1;

hveloc = 0;
vveloc = 0;

veloc = 2;
veloc_dir = -1;

dir = 0;

//DASH

dar_dir = -1;
dash_veloc = 6;


//ESTADO

estado = scr_personagem_andando;

//COMBATE
max_estamina = 100;
estamina = max_estamina;
max_vida = 5;
vida = max_vida;

tomardano = true;
empurrar_dir = 0;

dano = 1;
atacar = false;

dano_alfa = -1;

arma = 0;

puxar = false;
forca = 0;