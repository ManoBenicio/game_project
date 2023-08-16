/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

script_execute(estado);

depth = -y;

if alarm[1] <= 0{
	estamina += 1;
}

estamina = clamp(estamina,0, max_estamina);

if keyboard_check_pressed(ord("E")){
	arma += 1;
}
if keyboard_check_pressed(ord("Q")){
	arma -= 1;
}

if arma >= Armas.Altura{
	arma = 0;	
}else if arma < 0{
	arma = Armas.Altura - 1;	
}

