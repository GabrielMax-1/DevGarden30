func Chunk_Random(from : int, to : int, roundResult : bool):
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var i = rng.randf_range(from, to)
	if roundResult == true:
		i = int(i)
		
	return i
	
func Chunk_Seed():
	var i = randi()
	
	return i
