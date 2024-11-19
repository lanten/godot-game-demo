extends Area2D


## 当节点第一次进入场景树时调用。
#func _ready() -> void:
	#print("ok")
	#pass # Replace with function body.
#
#
## 调用每一帧。 “delta”是自上一帧以来经过的时间。
#func _process(delta: float) -> void:
	#pass


func _on_body_entered(body: Node2D) -> void:
	#if body.name == "player":
	print(body.name + " 金币 +1 !")
	queue_free()
	pass
	
