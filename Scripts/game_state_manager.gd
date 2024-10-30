extends Node

class_name  GameStateManager

@onready var mines_grid: MinesGrid = $"../TileMap"
@onready var ui: UI = $"../UI"

@onready var timer: Timer = $Timer

var time_elapsed = 0


func _ready() -> void:
	mines_grid.game_lost.connect(on_game_lost)
	mines_grid.game_won.connect(on_game_won)
	mines_grid.flag_change.connect(on_flag_change)
	ui.set_mine_count(mines_grid.number_of_mines)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	time_elapsed += 1
	ui.set_timer_count(time_elapsed)

func on_game_lost():
	timer.stop()
	ui.game_lost()

func on_game_won():
	timer.stop()
	ui.game_won()

func on_flag_change(flags_count):
	print(flags_count)
