# frozen_string_literal: true

require './data'
require './helpers'

# creates genetic string for a not-cat
class Genome
  attr_reader :wind_alleles
  attr_writer :color_type_hash
  attr_accessor :o_and_b_alleles

  def initialize
    @species_allele = '?'
    @wind_alleles = ['?', '?']
    @fur_alleles = ['?', '?']
    @o_and_b_alleles = ['?', '?']
    @dilute_alleles = ['?', '?']
    @color_num_allele = '?'
    @color_type_hash = nil
    @pattern_alleles = ['?', '?', '?', '?']
    @white_alleles = ['?', '?', '?', '?']
    @growth_alleles = ['?', '?']
    @accent_alleles = ['?', '?']
  end

  def genome_string
    "[#{@species_allele}] [#{@wind_alleles.join}] [#{@fur_alleles.join}] [#{@o_and_b_alleles.join}#{@dilute_alleles.join}#{@color_num_allele}] [#{@pattern_alleles.join}] [#{@white_alleles.join}] [#{@growth_alleles.join}] [#{@accent_alleles.join}]"
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

  def orange_black_dominant(color_type)
    puts 'Is your cat in the orange group or the black group?'
    print_color_options(color_type)
    puts 'ORANGE (O) or BLACK (B)'
    color1 = gets.chomp
    @o_and_b_alleles[0] = color1
    @o_and_b_alleles[1] = orange_black_recessive
  end

  def orange_black_recessive
    if @o_and_b_alleles[0] == 'O'
      recessive_black ? 'B' : 'O'
    else
      recessive_orange ? 'O' : 'B'
    end
  end

  def dilute(color_type)
    puts 'Is your not cat full color or dilute?'
    print_dilute_options(color_type)
    puts 'FULL (F) or DILUTE (D)'
    dilute = gets.chomp
    dilute_carrier = recessive_dilute if dilute == 'D'
    dilutes = {
      'F' => dilute_carrier ? %w[F D] : %w[F F], 'D' => %w[D D]
    }
    @dilute_alleles = dilutes[dilute]
  end

  def dilute_albino
    if recessive_dilute
      puts 'Are all of the beans in the dilute group?'
      puts 'YES (Y) or NO (N)'
      @dilute_alleles = gets.chomp == 'Y' ? %w[D D] : %w[F D]
    else
      @dilute_alleles = %w[F F]
    end
  end

  def color_num(color_type)
    puts "What is your cat's color number?"
    print_color_table(color_type)
    puts 'ONE (1), TWO (2), THREE (3), or FOUR(4)'
    color_num = gets.chomp
    @color_num_allele = color_num
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

def recessive_dilute
  puts 'Put your not cat in the bean sandbox with a not cat with a recessive dilute trait.'
  puts 'Are any of the beans in the dilute group?'
  puts 'YES (Y) or NO (N)'
  gets.chomp == 'Y'
end

def decode_new_genome(genome)
  genome.species
  genome.wind
  genome.fur
  if albino
    decode_albino(genome)
  elsif genome.wind_alleles == %w[N S]
    genome.orange_black_dominant(WC_COLORS)
  elsif genome.wind_alleles != %w[O O]
    genome.orange_black_dominant(COLORS)
  end
end

def decode_albino(genome)
  has_black = recessive_black
  genome.o_and_b_alleles =
    if has_black
      recessive_orange ? %w[B O] : %w[B B]
    else
      %w[O O]
    end
  genome.dilute_albino
end

genome = Genome.new
decode_new_genome(genome)
puts "Your not cat's genetic string is:"
puts genome.genome_string
