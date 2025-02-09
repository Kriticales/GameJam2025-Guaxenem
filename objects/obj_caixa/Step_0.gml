/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
x += h_vel;
y += v_vel;

var _colisao = noone;

_colisao = collision_rectangle(
x - interagir,
y - interagir,
x + interagir,
y + interagir,
obj_player,
false,
true)