# frozen_string_literal: true

require './data'
require './helpers'

# creates genetic string for a not-cat
class Genome
  attr_reader :wind_alleles
  attr_writer :color_type_hash

  def initialize
    @species_allele = '?'
    @wind_alleles = ['?', '?']
    @fur_alleles = ['?', '?']
    @color_alleles = ['?', '?', '?', '?', '?']
    @color_type_hash = nil
    @pattern_alleles = ['?', '?', '?', '?']
    @white_alleles = ['?', '?', '?', '?']
    @growth_alleles = ['?', '?']
    @accent_alleles = ['?', '?']
  end

  def genome_string
    "[#{@species_allele}] [#{@wind_alleles.join}] [#{@fur_alleles.join}] [#{@color_alleles.join}] [#{@pattern_alleles.join}] [#{@white_alleles.join}] [#{@growth_alleles.join}] [#{@accent_alleles.join}]"
  end

  def species
    puts 'What species is your not cat?'
    puts 'CAT (C) or MERCAT (M)'
    @species_allele = gets.chomp
  end

  def wind
    puts 'What wind does your not cat have?'
    puts 'NORTH (N), SOUTH (S), TRADE (T), or NULL (O)'
    wind = gets.chomp
    null_carrier = recessive_null if %w[N S].include?(wind)
    winds = {
      'N' => null_carrier ? %w[N O] : %w[N N],
      'S' => null_carrier ? %w[S O] : %w[S S],
      'T' => %w[N S], 'O' => %w[O O]
    }
    @wind_alleles = winds[wind]
  end

  def fur
    puts 'Is your not cat shorthaired or longhaired?'
    puts 'SHORTHAIRED (S) or LONGHAIRED (L)'
    fur = gets.chomp
    longhair_carrier = recessive_longhair if fur == 'S'
    furs = {
      'S' => longhair_carrier ? %w[S L] : %w[S S], 'L' => %w[L L]
    }
    @fur_alleles = furs[fur]
  end

  def color_type
    puts 'Is your not cat watercolor or tortoiseshell?'
    puts 'WATERCOLOR (W) or TORTOISESHELL (T)'
    type = gets.chomp
    color_types = { 'W' => WC_COLORS }
    @color_type_hash = color_types[type]
  end

  def color_group(color_type)
    print_color_options(color_type)
    puts 'Is your cat in the orange group or the black group?'
    puts 'ORANGE (O) or BLACK (B)'
    @color_alleles[0] = gets.chomp
  end

  def visible_color(color)
    @color_alleles[0] = color
    @color_alleles[1] = if color == 'O'
                          recessive_black ? 'B' : 'O'
                        else
                          recessive_orange ? 'O' : 'B'
                        end
  end

  def color_num(color_type)
    puts "What is your cat's color number?"
    print_color_table(color_type)
    puts 'ONE (1), TWO (2), THREE (3), or FOUR(4)'
    color5 = gets.chomp
    @color_alleles[4] = color5
  end
end

def recessive_null
  puts 'Put your not cat in the bean sandbox with a North or South wind not cat with a recessive Null trait.'
  puts 'Do any of the beans come in the snow color?'
  puts 'YES (Y) or NO (N)'
  gets.chomp == 'Y'
end

def recessive_longhair
  puts 'Put your not cat in the bean sandbox with a longhaired not cat.'
  puts 'Do any of the beans have long hair?'
  puts 'YES (Y) or NO (N)'
  gets.chomp == 'Y'
end

def albino
  puts 'Is your not cat albino?'
  puts 'YES (Y) or NO (N)'
  gets.chomp == 'Y'
end

def recessive_black
  puts 'Put your not cat in the bean sandbox with a not cat with a recessive black trait.'
  puts 'Are any of the beans in the black group?'
  puts 'YES (Y) or NO (N)'
  gets.chomp == 'Y'
end

def recessive_orange
  puts 'Put your not cat in the bean sandbox with a not cat with a recessive orange trait.'
  puts 'Are any of the beans in the orange group?'
  puts 'YES (Y) or NO (N)'
  gets.chomp == 'Y'
end

def dilute(color_type)
  puts 'Is your not cat dilute?'
  print_dilute_options(color_type)
  puts 'YES (Y) or NO (N)'
  gets.chomp == 'Y'
end

def decode_new_genome(genome)
  genome.species
  genome.wind
  genome.fur
  if albino
    puts 'Not cat is albino.'
  elsif genome.wind_alleles == %w[N S]
    genome.color_type
  elsif genome.wind_alleles != %w[O O]
    genome.color_type_hash = COLORS
  end
end

genome = Genome.new
decode_new_genome(genome)
puts "Your not cat's genetic string is:"
puts genome.genome_string
