extends Node

func _ready():
	getAllNodes()
	

func getAllNodes():
		$Worker1/businessman.material_override.albedo_color = Color(1,0,0)
		print("HERE")
		$Worker2/businessman.material_override.albedo_color = Color(1,0,0)
		