class Raspberry
    @states = { 0 => 'no malina', 1 => 'growing', 2 => 'green', 3 => 'yummy' }
  
    def initialize(index = 0, state = 0)
      @index = index
      @state = state > 3 ? 3 : state
    end
  
    def grow!
      @state < 3 ? @state += 1 : @state
    end
  
    def ripe?
      @state == 3
    end
    def have_status
        @state
      end
end

class RaspberryBash
    def initialize(number)
        @raspberries = []
        number.times do |index|
            raspberry = Raspberry.new(index)
            @raspberries << raspberry
        end
    end
  
    def grow_all!()
        @raspberries.each(&:grow!)
    end
  
    def ripe_all?()
        @raspberries.map(&:ripe?).all?
    end
  
    def give_away_all!()
        @raspberries.map { |raspberries| raspberries.have_status == 3 ? nil : raspberries }.compact
    end
    def get_raspberries()
        puts @raspberries.to_s
    end
end
  
class Human
    def initialize(name, plant)
        @name = name
        @plant = plant
    end
  
    def work()
        @plant.grow_all!
    end
  
    def harvest()
        if @plant.ripe_all?
            @plant.give_away_all!
            puts 'УРА КУШАТЬ'
        else
            puts 'КУШАТЬ НЕЛЬЗЯ!!'
        end
    end
  
    def self.knowledge_base()
        puts "Справка по моему садоводству:\nмалина очень вкусная, но колючая у меня дома. поэтому я не люблю ее собирать,\nно мне приходится, потому что я люблю ее кушать:(\n"
    end
end
  
if __FILE__ == $PROGRAM_NAME
    Human.knowledge_base
    raspberry_bash = RaspberryBash.new(5)
    user = Human.new('Raily', raspberry_bash)
    user.work
    puts "Я поработала немного\n"
    user.harvest

    user.work
    puts "Я поработала немного\n"
    user.harvest

    user.work
    puts "Я поработала немного\n"
    user.harvest
  end
