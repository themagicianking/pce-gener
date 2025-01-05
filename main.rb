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
    winds = {
      'N' => ['N', '?'],
      'S' => ['S', '?'],
      'T' => %w[N S],
      'O' => %w[O O]
    }
    @wind = winds[wind]
  end
end

def determine_new_string
  genome = Genome.new
  genome.set_species
  genome.set_wind
  puts "Your not cat's genetic string is:"
  puts genome.genome_string
end

determine_new_string
