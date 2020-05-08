
# https://devdocs.io/ruby~2.6/regexp

# Expresiones regulares:
	#-Para buscar en un String una expresión regular (patron de caracteres)

	EXPRESIÓN	SIGNIFICADO
	.		=>	cualquier caracter
	[]		=>	especificación por rango. P.ej: [a-z], una letra de la a, a la z
	\w		=>	letra o número; es lo mismo que [0-9A-Za-z]
	\W		=>	cualquier carácter que no sea letra o número
	\s		=>	carácter de espacio; es lo mismo que [ \t\n\r\f]
	\S		=>	cualquier carácter que no sea de espacio
	\d		=>	número; lo mismo que [0-9]
	\D		=>	cualquier carácter que no sea un número
	\b		=>	retroceso (0x08), si está dentro de un rango
	\b		=>	límite de palabra, si NO está dentro de un rango
	\B		=>	no límite de palabra
	*		=>	cero o más repeticiones de lo que le precede
	+		=>	una o más repeticiones de lo que le precede
	$		=>	fin de la línea
	{m,n}	=>	como menos m, y como mucho n repeticiones de lo que le precede
	?		=>	al menos una repetición de lo que le precede; lo mismo que {0,1}
	()		=>	agrupar expresiones
	||		=>	operador lógico O, busca lo de antes o lo después	

# match
    # Returns a MatchData object describing the match, or nil if there was no match. This is equivalent to retrieving the value of the special variable $~ following a normal match. If the second parameter is present, it specifies the position in the string to begin the search.
    /expre/.match(cadena)
    
    /R.../.match?("Ruby")    #=> true
    /R.../.match?("Ruby", 1) #=> false
    /P.../.match?("Ruby")    #=> false
    $&                       #=> nil

	string = "Mi número de teléfono es (123) 555-1234."  
	num_expr = /\((\d{3})\)\s+(\d{3})-(\d{4})/ # expresión regular
	#  /   \(  (\d{3})  \)  \s+  (\d{3})  -  (\d{4})   /
	# parentesis; 3 numeros; parentesis; espacios; 3 numeros; 4 numeros 
	m = num_expr.match(string)
	m.string		# retorna la expresion base: Mi número de teléfono es (123) 555-1234
	m.captures		# Partes:	[123, 555, 1234]
	m[0] 			# Resultado: (123) 555-1234

# regexp:
    # =~ If a match is found, the operator returns index of first match in string, otherwise it returns nil.
	(str =~ /[0-9]/)			# Return the index of first number
	!!(str =~ /[aeiou]/)		# Return true or false
	!!(str =~ /#{my_variable}/)	# search a variable into str

# Options
    /pat/i # Ignore case
    /pat/m # Treat a newline as a character matched by .
    /pat/x # Ignore whitespace and comments in the pattern    
    /pat/o # Perform #{} interpolation only once