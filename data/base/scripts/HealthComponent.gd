extends Node2D
class_name HealthComponent

@export var max_health: float = 100.0
var health : float

func _ready():
	health = max_health

func damage(amount: float):
	health -= amount

	if health <= 0:
		get_parent().queue_free()