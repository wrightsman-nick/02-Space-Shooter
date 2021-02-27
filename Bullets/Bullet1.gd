extends Area2D

var speed = 2
var velocity = Vector2.ZERO
var Explosion = load("res://Explosion/Explosion.tscn")
onready var Explosions = get_node("/root/Game/Explosions")

func _physics_process(_delta):
	position += velocity
	velocity.y -= speed
	if position.y < -500:
		queue_free()


func _on_Bullet1_body_entered(body):
	body.die(10)
	var explosion = Explosion.instance()
	explosion.position = position
	explosion.playing = true
	Explosions.add_child(explosion)
	queue_free()
