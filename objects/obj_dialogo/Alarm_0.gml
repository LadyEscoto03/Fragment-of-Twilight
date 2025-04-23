/// @description Insert description here
// You can write your code in this editor

if (inicio <= string_length(texto)) {
    var letra = string_char_at(texto, inicio);
    texto2 += letra;

    // Verificamos si hay que hacer un salto de línea
    if ((string_length(texto2) mod max_caracteres_linea) == 0 and letra == " ") {
        texto2 += "\n";
    }

    inicio += 1;
    alarm[0] = 3;
} else {
    alarm[1] = 300;
}