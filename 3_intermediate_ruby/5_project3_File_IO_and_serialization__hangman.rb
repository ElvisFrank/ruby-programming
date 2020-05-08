# REGLAS
    # Words of 5..12 characters from 5desk.txt
    # (_ r o g r a _ _ i n g) display the corrects letters and the incorrect letters have already benn chosen
    # Every turn, allow the player to make a guess of a letter. ignore case.
    # se tendra un limite de intentos fallidos: 3
    # 10 puntos sera la calificación máxima
    # minima 0 y otros = 10 * (aciertos / numero_letras_unicas)
    # Se debe poder guardar el juego y continuar cuando se inicie el programa en caso de no ser finalizado


module HangmanModule
    FILE = '5desk.txt'

    def load_word
        file = File.open(FILE, 'r')
        until file.eof?
            lines = file.readlines.map{|word| word.chop}
            lines.select! { |e|  (5..12) === e.length }
            
            return lines[rand(lines.length)]
        end
    end

    def display_load(message, message_wait, time_wait, repeat_times)
        print message
        repeat_times.times do
            sleep time_wait
            print message_wait
        end
        puts
    end

    def imput_string_validate(message, min_length, max_length)
        begin
            print "#{message}: "
            imput = gets.chop
        end until (min_length..max_length) === imput.length
        imput.capitalize!
    end
end

class Hangman
    include HangmanModule

    def start
        puts "///////////////WELCOME///////////////"
        puts "///////////////   TO  ///////////////"
        puts "///////////////HANGMAN///////////////"
        existe_partida ? cargar_local : iniciar

    end

    private
    def existe_partida
        false
    end

    def cargar_local
    end
    
    def iniciar
        display_load("Cargando partida", '.', 0.15, 21)
        @player1 = imput_string_validate("\tJugador #1", 2, 12)
        @player2 = imput_string_validate("\tJugador #2", 2, 12)
        
        display_load("#{@player1} VS #{@player2} - Start", '!', 0.4, 3)
        @rondas = Array.new([0,0])
    end


end

hang = Hangman.new.start
