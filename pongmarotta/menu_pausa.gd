extends CanvasLayer

var modo_maquina: bool = false

func _ready() -> void:
	get_tree().paused = true
	visible = true
	process_mode = Node.PROCESS_MODE_ALWAYS

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		_alternar_pausa()

func _alternar_pausa() -> void:
	get_tree().paused = !get_tree().paused
	visible = get_tree().paused

func _on_btn_play_pressed() -> void:
	_alternar_pausa()

func _on_btn_reiniciar_pressed() -> void:
	get_tree().paused = false
	visible = false

	$"%Puntos1".text = "0"
	$"%Puntos2".text = "0"
	var bola = $"%Pelota"
	bola.puntos_p1 = 0
	bola.puntos_p2 = 0
	get_parent().get_node("UI").tiempo_jugado = 0
	bola.iniciar_saque(1)

func _on_btn_modo_pressed() -> void:
	modo_maquina = !modo_maquina
	$"%Paleta2".es_cpu = modo_maquina

	if modo_maquina:
		$"%BtnModo".text = "Modo Contra Máquina"
	else:
		$"%BtnModo".text = "Modo 1 vs 1"
