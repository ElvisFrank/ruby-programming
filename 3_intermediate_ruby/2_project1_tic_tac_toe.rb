class TicTacToe
    def self.start
        puts "Bienvenido al juego de Tic Tac:\nCada jugador debera ingresar una posicion [1..9]"
        table = Array.new(9)
        9.times do |jugada|
            pushet = jugada.even? ? 'X' : 'O'
            begin
                self.mostrar table
                print "Jugada ##{jugada + 1}, turno de #{jugada.even? ? 'X' : 'O'}: "
                index_pushed = gets.chomp.to_i - 1
                valido = !!(table[index_pushed] =~ /X|O/) ? false : true
                table[index_pushed] = pushet if valido
            end until valido
            # validar
            break puts "Gana el jugador #{pushet}" if self.index_search table, pushet
        end
        self.mostrar table
    end

    def self.index_search vector,letra
        posible = [
            vector[0..2], vector[3..5], vector[6..8],
            [vector[0], vector[3], vector[6]],
            [vector[1], vector[4], vector[7]],
            [vector[2], vector[5], vector[8]],
            [vector[0], vector[4], vector[8]],
            [vector[2], vector[4], vector[6]]
        ]
        posible.reduce(false) {|acc, val| !!(val[0..2].join() =~ /#{letra*3}/) ? true : acc}
    end

    def self.mostrar tablero
        puts '**************************************'
        9.times do |index|
            print "| #{ tablero[index] =~ /X|O/ ? tablero[index] : ' '} |"
            puts if (index + 1) % 3 == 0
        end
        puts "**************************************\n\n"
    end
end

#TicTacToe.start


# Reglas: 
# 4 filas para la clave
# 6 colores
# 4 filas x12 intentos
# 4 filas x12 para: clavijas clave (blanco y negro)
# 2 carriles para las vaquitas
# ###
# P1: genera la clave
# P2: ubicará en los 4 espacios los colores en el orden que crea conveniente
# P1: pondra una CLAVIJA BLANCA en la dirección referente si el color esta en
#   la combinacion pero no en el order conrrecto. CLAVIJA NEGRA si el color
#   y orden es correcto.
# P2: volvera a intentar en las posiciones que no tienen CLAVIJAS NEGRAS.
# se repetira el proceso hasta que P2 descubra la clave de P1
# ###
# El numero de intentos que le tomen al jugador P2 seran los puntos para P1
#   la vaquita de P1 avanazara dichas posiciones
#
# Se intercambian roles. Gana el que haya avanzado mas (su vaquita) en el
#   numero de partidas establecidas.

module MasterModule
    
    def clave_generate colors_first_letter, size = 4
        result = Array.new
        begin
            result << colors_first_letter[rand(colors_first_letter.length)]
            result.uniq!
        end until result.length == size
        result
    end

    def print_table data, colors, size = 4
        puts "------------//////////------------"
        puts "------------Mastermind------------"
        puts "////////////----------////////////"
        puts "Colores en juego: "
        colors.each {|color| puts "\t[#{color[0]}] #{color}"}

        return if data.length < 1
        data.each_with_index do |jugada, indice|
            puts "Intento ##{(indice + 1).to_s}  => [#{jugada[0...size].join('-')}] <=> [#{jugada[size...size*2].join('-')}]"
        end
        puts "\n"
    end
end


class Mastermind
    include MasterModule

    def start rondas, size = 4
        colors = ['ROJO', 'VERDE', 'NARANJA', 'AZUL', 'CELESTE', 'MARRON']
        colors_first_letter = colors.reduce("") {|acc,color| acc += color[0].upcase}
        avance_de_vaquitas = [0, 0]  #[P1, P2]
        
        rondas.times do | ronda |
            intentos = Array.new([])
            puts "P#{((ronda)%2 + 1)} Cifra mensaje..."
            clave = clave_generate(colors_first_letter, size)
            puts "... Clave generada!"

            12.times do | jugada |
                print_table(intentos, colors, size)
                print "Turno de P#{((1+ronda)%2 + 1)} - Ingrese su clave  de #{size} Dig: "
                intentos[jugada] = gets.chomp.upcase.split(//)[0...size]
                
                # retroalimentación por el cifrador
                size.times do |index|
                    if intentos[jugada][index].nil? || !(colors_first_letter =~ /#{intentos[jugada][index]}/i)
                        intentos[jugada][index + size] = ' '
                        intentos[jugada][index] = 'X'
                    elsif intentos[jugada][index] == clave[index]
                        intentos[jugada][index + size] = 'N'
                    else
                        intentos[jugada][index + size] = !!(clave.join =~ /#{intentos[jugada][index]}/i) ? 'B' : ' '
                    end
                end

                # verificar
                break if clave.join == intentos[jugada][0...size].join
            end
            
            # Banace
            avance_de_vaquitas[ronda % 2] += intentos.length
            print_table(intentos, colors, size)
            
            # Fin de turno
            puts "Carril 1: #{'='*avance_de_vaquitas[0]} V1"
            puts "Carril 2: #{'='*avance_de_vaquitas[1]} V2"
            puts "Puntaje:\n\tP1 = #{avance_de_vaquitas[0]}\n\tP2 = #{avance_de_vaquitas[1]}"
        end
        if avance_de_vaquitas[0] > avance_de_vaquitas[1]
            puts "WIN TO PLAYER '1'"
        elsif avance_de_vaquitas[0] < avance_de_vaquitas[1]
            puts "WIN TO PLAYER '2'"
        else
            puts "EMPATE"
        end
    end
    
end

rondas = 6
size = 5
Mastermind.new.start rondas, size