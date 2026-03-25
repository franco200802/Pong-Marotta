extends CanvasLayer

var tiempo_jugado = 0.0

func _ready():
	$"%Puntos1".text = "0"
	$"%Puntos2".text = "0"
	$"%Tiempo".text = "0"

func _process(delta):
	tiempo_jugado += delta
	$"%Tiempo".text = str(int(tiempo_jugado))
