# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase
	def test_suma
		assert_equal("2/5",Fraccion.new(1,5).suma(Fraccion.new(1,5)).to_s)
		assert_equal("1/2",Fraccion.new(1,4).suma(Fraccion.new(1,4)).to_s)
		assert_equal("7/10",Fraccion.new(1,5).suma(Fraccion.new(2,4)).to_s)
	end
	
	def test_resta
		assert_equal("2/5",Fraccion.new(3,5).resta(Fraccion.new(1,5)).to_s)
		assert_equal("5/6",Fraccion.new(4,3).resta(Fraccion.new(1,2)).to_s)
	end
	
	def test_producto
		assert_equal("1/6",Fraccion.new(1,4).producto(Fraccion.new(2,3)).to_s)
		assert_equal("10/9",Fraccion.new(5,3).producto(Fraccion.new(2,3)).to_s)
	end
	
	def test_division
		assert_equal("32/3",Fraccion.new(4,3).division(Fraccion.new(1,8)).to_s)
		assert_equal("7/6",Fraccion.new(1,3).division(Fraccion.new(2,7)).to_s)
	end
end
