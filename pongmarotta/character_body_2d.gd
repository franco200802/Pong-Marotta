extends CharacterBody2D

var velocidad = 400.0

func _physics_process(delta):
	var direccion = 0
	
	if Input.is_physical_key_pressed(KEY_W):
		direccion -= 1
	if Input.is_physical_key_pressed(KEY_S):
		direccion += 1
		
	velocity.y = direccion * velocidad
	move_and_slide()
