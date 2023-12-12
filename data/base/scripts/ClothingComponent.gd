extends Node2D
class_name ClothingComponent

# Maximum health for the clothing
@export var max_clothing_health: float = 100.0

# Current health of the clothing
var clothing_health : float

# Define a variable to store clothing textures
# Each texture is a string representing the file path
@export var clothing_textures = [
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

# Declare a variable to store the parent sprite
@onready var parent_sprite = get_parent().get_node("Texture") as Sprite2D

# Function called when the node is ready
func _ready():
	# Initialize the clothing health
	clothing_health = max_clothing_health
	print("clothing_health:" + str(clothing_health))
	
	# Print the clothing textures
	print("Clothing textures: " + str(clothing_textures))
	
	# Print the length of the clothing textures
	print("clothing_textures length: " + str(len(clothing_textures)))
	
	# Update the clothing texture with the first texture in the list
	force_update_clothing_texture(clothing_textures[0])

func damage_clothing(amount: float):
	# Print the amount of damage
	print("Damage amount: " + str(amount))
	
	# Reduce the clothing health by the damage amount
	if clothing_health > 0:
		clothing_health -= amount
	
	# Print the updated clothing health
	print("Clothing health: " + str(clothing_health))
	
	# Update the clothing texture based on the current health
	update_clothing_texture(clothing_health)

func update_clothing_texture(clothing_health):
	# Calculate the index of the clothing texture based on the clothing health
	var clothing_index = int((max_clothing_health - clothing_health) / max_clothing_health * (len(clothing_textures) - 1))
	print("Clothing index before: " + str(clothing_index))

	# Clamp the clothing index to ensure it stays within the valid range
	clothing_index = clamp(clothing_index, 0, len(clothing_textures) - 1)
	print("Clothing index after: " + str(clothing_index))

	# Get the path of the clothing texture based on the index
	var texture_path = clothing_textures[clothing_index]
	print("Texture path: " + texture_path)

	# Load and set the texture of the parent sprite
	parent_sprite.texture = load(texture_path)

# This function updates the clothing texture of the parent sprite.
# It takes in the path of the new texture and applies it to the parent sprite. Used for debugging and cheating purposes

func force_update_clothing_texture(texture_path):
	# Load the new texture using the provided path.
	parent_sprite.texture = load(texture_path)

# TODO: Add code to restore clothing
func restore_clothing():
	pass
