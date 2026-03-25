extends CharacterBody2D

@export var velocidad_movimiento: float = 400.0
var posicion_x_fija: float

func _ready() -> void:
	posicion_x_fija = global_position.x

func _physics_process(_delta: float) -> void:
	var entrada_vertical = 0
	
	if Input.is_physical_key_pressed(KEY_W):
		entrada_vertical -= 1
	if Input.is_physical_key_pressed(KEY_S):
		entrada_vertical += 1
		
	velocity.y = entrada_vertical * velocidad_movimiento
	move_and_slide()
	
	global_position.x = posicion_x_fija
