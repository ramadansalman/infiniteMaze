extends Control


var seed_line_edit: LineEdit

func _ready():
	seed_line_edit = $LineEdit # LineEdit'i düğmeye bağlayın


func _on_SeedEntered(new_text: String):
	var seed_value = new_text.strip_edges() # Kullanıcının girdiği seed değerini al
	if seed_value != "":
		print("Kullanıcı seed'i girdi: ", seed_value)
		randomize() # Seed sıfırlanır
		
	else:
		print("Seed değeri girilmedi. Varsayılan değer kullanılacak.")
		randomize() # Eğer bir seed değeri girilmediyse, varsayılan olarak seed sıfırlanır
