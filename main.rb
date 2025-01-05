# frozen_string_literal: true

# creates genetic string for a not-cat
class Genome
  attr_accessor :species

  def initialize
    @species = '?'
    @wind = ['?', '?']
    @fur = ['?', '?']
    @color = ['?', '?', '?', '?', '?']
    @pattern = ['?', '?', '?', '?']
    @white = ['?', '?', '?', '?']
    @growth = ['?', '?']
    @accent = ['?', '?']
  end

  def genome_string
    "[#{@species}] [#{@wind.join}] [#{@fur.join}] [#{@color.join}] [#{@pattern.join}] [#{@white.join}] [#{@growth.join}] [#{@accent.join}]"
  end

  def set_species
    puts 'What species is your not cat?'
    puts 'CAT (C) or MERCAT (M)'
    @species = gets.chomp
  end

  def set_wind
    puts 'What wind does your not cat have?'
    puts 'NORTH (N), SOUTH (S), TRADE (T), or NULL (O)'
    wind = gets.chomp
    recessive_null = check_recessive_null if %w[N S].include?(wind)
    winds = {
      'N' => recessive_null ? %w[N O] : %w[N N],
      'S' => recessive_null ? %w[S O] : %w[S S],
      'T' => %w[N S], 'O' => %w[O O]
    }
    @wind = winds[wind]
  end

  def check_recessive_null
    puts 'Put your not cat in the bean sandbox with a North or South wind not cat with a recessive Null trait.'
    puts 'Do any of the beans come in the snow color?'
    puts 'YES (Y) or NO (N)'
    null = gets.chomp
    null == 'Y'
  end

  def set_fur
    puts 'Is your not cat shorthaired or longhaired?'
    puts 'SHORTHAIRED (S) or LONGHAIRED (L)'
    fur = gets.chomp
    fur == 'S' ? @fur[0] = 'S' : @fur = %w[L L]
  end
end

def determine_new_string
  genome = Genome.new
  genome.set_species
  genome.set_wind
  genome.set_fur
  puts "Your not cat's genetic string is:"
  puts genome.genome_string
end

determine_new_string
