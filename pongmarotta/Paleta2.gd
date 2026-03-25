extends CharacterBody2D

@export var agilidad: float = 450.0
var es_cpu: bool = false
var x_estatica: float

var desvio_ia: float = 0.0
var temporizador_ia: float = 0.0

func _ready() -> void:
	x_estatica = global_position.x

func _physics_process(delta: float) -> void:
	var movimiento = 0.0
	var nodo_bola = get_node("%Pelota")
	
	temporizador_ia += delta
	if temporizador_ia > 0.5:
		desvio_ia = randf_range(-40, 40)
		temporizador_ia = 0
		
	if es_cpu:
		if nodo_bola.velocity.x < 0:
			if global_position.y < 314: movimiento = 1
			elif global_position.y > 334: movimiento = -1
		else:
			var punto_destino = nodo_bola.global_position.y + desvio_ia
			if global_position.y < punto_destino - 15: movimiento = 1
			elif global_position.y > punto_destino + 15: movimiento = -1
	else:
		movimiento = Input.get_axis("ui_up", "ui_down")
			
	velocity.y = movimiento * agilidad
	move_and_slide()
	global_position.x = x_estatica
