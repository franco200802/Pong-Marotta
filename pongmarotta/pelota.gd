extends CharacterBody2D

@export var rapidez_base: float = 500.0
var puntos_p1: int = 0
var puntos_p2: int = 0

func _ready() -> void:
	iniciar_saque(1)

func _physics_process(delta: float) -> void:
	var impacto = move_and_collide(velocity * delta)
	
	if impacto:
		velocity = velocity.bounce(impacto.get_normal())
		
	if global_position.x < 0:
		_anotar_gol(2)
	elif global_position.x > 1152:
		_anotar_gol(1)

func _anotar_gol(jugador: int) -> void:
	if jugador == 1:
		puntos_p1 += 1
		$"%Puntos1".text = "Player 1: " + str(puntos_p1)
		iniciar_saque(-1) 
	else:
		puntos_p2 += 1
		$"%Puntos2".text = "Player 2: " + str(puntos_p2)
		iniciar_saque(1) 

func iniciar_saque(direccion_x: int) -> void:
	global_position = Vector2(576, 324)
	velocity = Vector2.ZERO
	await get_tree().create_timer(1.0).timeout
	
	var angulo_y = randf_range(-0.5, 0.5)
	velocity = Vector2(direccion_x, angulo_y).normalized() * rapidez_base
