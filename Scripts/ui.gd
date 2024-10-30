extends CanvasLayer

class_name UI

@onready var mine_count_label: Label = %MineCountLabel
@onready var game_status_button: TextureButton = %GameStatusButton
@onready var timer_count_label: Label = %TimerCountLabel

var game_lost_button_texture = preload("res://Assets/button_dead.png")
var game_won_button_texture = preload("res://Assets/button_cleared.png")

func set_mine_count(mine_count: int):
	var mine_count_string = str(mine_count)
	if mine_count_string.length() < 3:
		mine_count_string = mine_count_string.lpad(3,"0")
	
	mine_count_label.text = mine_count_string
	

func set_timer_count(timer_count:int):
	var timer_string = str(timer_count)
	if timer_string.length() < 3:
		timer_string = timer_string.lpad(3,"0")
	
	timer_count_label.text = timer_string


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_status_button_pressed() -> void:
	get_tree().reload_current_scene()


func game_lost():
	game_status_button.texture_normal = game_lost_button_texture

func game_won():
	game_status_button.texture_normal = game_won_button_texture
