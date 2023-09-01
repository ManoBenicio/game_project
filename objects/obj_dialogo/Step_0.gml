/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

if inicializar == false{
	scr_textos();
	inicializar = true;
}


if keyboard_check_pressed(ord("F")){
	if pagina < array_length_1d(texto) -1{
		pagina ++;
	}else{
		instance_destroy();	
		global.dialogo = false;
	}
	
}






