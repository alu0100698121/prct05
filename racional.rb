# Implementar en este fichero la clase para crear objetos racionales

require "./gcd.rb"

class Fraccion
	attr_accessor :n, :d #Getters & Setters
	
	def initialize (n, d) #Inicializa el numerador (n) y denominador (d) de la fraccion.
		if (d != 0)
			@n, @d = n, d
		else
			@n, @d = n, 1
		end
	end
	
	def to_s #Devuelve una cadena con la representacion del racional
		"#{@n}/#{@d}"
	end
	
	def suma (other) #Devuelve un nuevo racional que suma al objeto que invoca el que le pasan como parametro
		if @d != other.d #Si los denominadores son distintos
			mcm = (@d * other.d) / gcd(@d, other.d) #Se halla el minimo comun multiplo
			num_a = (mcm / @d) * @n					#Se halla el nuevo numerador del primer sumando
			num_b = (mcm / other.d) * other.n		#Se halla el nuevo numerador del segundo sumando
		else	#Si los denominadores son iguales
			mcm = @d			#Se mantiene el divisor
			num_a = @n			
			num_b = other.n
		end
		
		num_res = num_a+num_b					#Se halla el numerador del resultado de la suma
		mcd = gcd(num_res,mcm)					#Se halla el maximo comun divisor entre numerador y denominador
												#para reducirlos a la minima expresion
		Fraccion.new(num_res/mcd, mcm/mcd)
	end
	
	def resta (other) #Devuelve un nuevo racional que resta al objeto que invoca el que le pasan como parametro
		if @d != other.d #Si los denominadores son distintos
			mcm = (@d * other.d) / gcd(@d, other.d) #Se halla el minimo comun multiplo
			num_a = (mcm / @d) * @n					#Se halla el nuevo numerador del minuendo
			num_b = (mcm / other.d) * other.n		#Se halla el nuevo numerador del sustraendo
		else	#Si los denominadores son iguales
			mcm = @d			#Se mantiene el divisor
			num_a = @n			
			num_b = other.n
		end
		
		num_res = num_a-num_b					#Se halla el numerador del resultado de la resta
		mcd = gcd(num_res,mcm)					#Se halla el maximo comun divisor entre numerador y denominador
												#para reducirlos a la minima expresion
		Fraccion.new(num_res/mcd, mcm/mcd)
	end
	
	def producto (other) #Devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan como parametro
		mcd = gcd(@n*other.n,@d*other.d)		#Se halla el maximo comun divisor entre numerador y denominador
												#para reducirlos a la minima expresion
		Fraccion.new((@n*other.n)/mcd,(@d*other.d)/mcd)
	end
	
	def division (other) #Devuelve un nuevo racional que divide al objeto que invoca el que le pasan como parametro
		mcd = gcd(@n*other.d,@d*other.n)		#Se halla el maximo comun divisor entre numerador y denominador
												#para reducirlos a la minima expresion
		Fraccion.new((@n*other.d)/mcd,(@d*other.n)/mcd)
	end
end