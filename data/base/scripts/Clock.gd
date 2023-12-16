extends Sprite2D

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
			print("Clicked on advance time!")

			# Access the Characters node within the cabin_01
			var characters_node = get_parent().get_node("Characters")

			for child in characters_node.get_children():
				print(child.name)
			
			# Iterate through the children of the Characters node
			for child in characters_node.get_children():
				if child is Node2D:  # Adjust this condition based on the actual type of your character nodes
					# Check if HealthComponent and ClothingComponent exist for each character
					if child.has_node("HealthComponent") and child.name.to_lower() == "scarlet2":
						print("Found HealthComponent on " + child.name + "!")
						var health_component = child.get_node("HealthComponent")
						health_component.damage(25)
					
					if child.has_node("ClothingComponent"):
						print("Found ClothingComponent on " + child.name + "!")
						var clothing_component = child.get_node("ClothingComponent")
						clothing_component.damage_clothing(5)
