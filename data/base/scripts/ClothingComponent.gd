extends Node2D
class_name ClothingComponent

@export var max_clothing_health: float = 100.0
var clothing_health : float

var clothing_textures = [
	"res://data/base/textures/characters/scarlet/scarlet_clothes1.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes2.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes3.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes4.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes5.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes6.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes7.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes8.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes9.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes10.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes11.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes12.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes13.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes14.png",
	"res://data/base/textures/characters/scarlet/scarlet_clothes15.png"
]

@onready var parent_sprite = get_parent() as Sprite2D

func _ready():
	clothing_health = max_clothing_health

func damage_clothing(amount: float):
	print("Damage amount: " + str(amount))
	
	# Check if the current clothing texture is at index 15
	if clothing_health > 0 and clothing_health <= max_clothing_health - amount:
		clothing_health -= amount
		print("Clothing health: " + str(clothing_health))

		# Calculate the clothing index based on the remaining health
		var clothing_index = int(clothing_health / max_clothing_health * (len(clothing_textures) - 1))
		clothing_index = clamp(clothing_index, 0, len(clothing_textures) - 1)

		# Update the clothing texture based on the calculated index
		var texture_path = clothing_textures[clothing_index]
		print("Texture path: " + texture_path)
		parent_sprite.texture = load(texture_path)
	else:
		print("Clothing is at texture 15. Skipping damage.")

