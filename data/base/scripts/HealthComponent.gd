extends Node2D
class_name HealthComponent

@export var max_health: float = 100.0
var health : float

func _ready():
	health = max_health

func damage(amount: float):
	print("Damage amount: " + str(amount))
	print("Current health: " + str(health))
	health -= amount
	print("Current health: " + str(health))

	if health <= 0:
		print("Character died!")
		get_parent().queue_free()