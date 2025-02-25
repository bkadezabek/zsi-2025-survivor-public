extends Gun

@export var spread_angle: float = 20.0
@export var num_projectiles: int = 8

@onready var muzzle = $Muzzle
@onready var shooting_fx_sprite = $ShootingFXSprite

func shoot() -> void:
	for i in range(num_projectiles):
		var angle_offset = randf_range(-spread_angle, spread_angle)
		var direction = (get_global_mouse_position() - muzzle.global_position).normalized().rotated(deg_to_rad(angle_offset))
		
		# Kreiranje projektila
		var projectile = projectile_scene.instantiate()
		projectile.global_position = muzzle.global_position
		projectile.direction = direction
		get_tree().root.add_child(projectile)
