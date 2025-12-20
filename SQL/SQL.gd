extends Node

#var db = SQLite.new()
#
#func _ready() -> void:
	#db.path = "res://DATA/DB/TEST.db"
	#db.open_db()
	#db.query("SELECT * FROM questions")
	#var query_payload: Dictionary = {
		#"bank": "TEST2",
		#"title": "never gonna give you up",
		#"rating": 3.5,
		#"difficulty": 1,
		#"type": "choice",
		#"question_data": var_to_bytes({"right_answer": "A", "answers": ["A","B","C","D"]})
	#}
	##db.insert_row("questions", query_payload)
	#db.query("SELECT * FROM questions")
	#var array = db.query_result
	#for i in array:
		#if i["question_data"] != null:
			#print(bytes_to_var(i["question_data"]), "\nTITLE: ",i["title"], "\nRATING: ", i["rating"])
