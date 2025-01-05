# frozen_string_literal: true

require './data'
require './helpers'

# creates genetic string for a not-cat
class Genome
  attr_reader :wind_alleles

  def initialize
    @species_allele = '?'
    @wind_alleles = ['?', '?']
    @fur_alleles = ['?', '?']
    @color_alleles = ['?', '?', '?', '?', '?']
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
    recessive_null = check_recessive_null if %w[N S].include?(wind)
    winds = {
      'N' => recessive_null ? %w[N O] : %w[N N],
      'S' => recessive_null ? %w[S O] : %w[S S],
      'T' => %w[N S], 'O' => %w[O O]
    }
    @wind_alleles = winds[wind]
  end

  def check_recessive_null
    puts 'Put your not cat in the bean sandbox with a North or South wind not cat with a recessive Null trait.'
    puts 'Do any of the beans come in the snow color?'
    puts 'YES (Y) or NO (N)'
    gets.chomp == 'Y'
  end

  def fur
    puts 'Is your not cat shorthaired or longhaired?'
    puts 'SHORTHAIRED (S) or LONGHAIRED (L)'
    fur = gets.chomp
    recessive_longhair = check_recessive_longhair if fur == 'S'
    furs = {
      'S' => recessive_longhair ? %w[S L] : %w[S S], 'L' => %w[L L]
    }
    @fur_alleles = furs[fur]
  end

  def check_recessive_longhair
    puts 'Put your not cat in the bean sandbox with a longhaired not cat.'
    puts 'Do any of the beans have long hair?'
    puts 'YES (Y) or NO (N)'
    gets.chomp == 'Y'
  end

  def colors
    orange_or_black = check_orange_or_black
    if orange_or_black
      color_group
      visible_color(@color_alleles[0])
    else
      # something else
    end
  end

  def check_orange_or_black
    puts 'Is your not cat snow or albino?'
    puts 'YES (Y) or NO (N)'
    gets.chomp == 'N'
  end

  def color_group
    if @wind_alleles[0] == 'O'
      watercolor_colors
    else
      standard_colors
    end
    puts 'Is your cat in the orange group or the black group?'
    puts 'ORANGE (O) or BLACK (B)'
    @color_alleles[0] = gets.chomp
  end

  def visible_color(color)
    @color_alleles[0] = color
    @color_alleles[1] = if color == 'O'
                          check_recessive_black ? 'B' : 'O'
                        else
                          check_recessive_orange ? 'O' : 'B'
                        end
  end

  def check_recessive_black
    puts 'Put your not cat in the bean sandbox with a not cat with a recessive black trait.'
    puts 'Are any of the beans in the black group?'
    puts 'YES (Y) or NO (N)'
    gets.chomp == 'Y'
  end

  def check_recessive_orange
    puts 'Put your not cat in the bean sandbox with a not cat with a recessive orange trait.'
    puts 'Are any of the beans in the orange group?'
    puts 'YES (Y) or NO (N)'
    gets.chomp == 'Y'
  end

  def dilute(color_type)
    color_types = { 'standard' => COLORS, 'watercolor' => WC_COLORS }
    puts 'Is your not cat dilute?'

    puts 'YES (Y) or NO (N)'
    gets.chomp == 'Y'
  end

  def color_num(color_type)
    color_types = { 'standard' => COLORS, 'watercolor' => WC_COLORS }
    puts "What is your cat's color number?"
    print_color_table(color_types[color_type])
    puts 'ONE (1), TWO (2), THREE (3), or FOUR(4)'
    color5 = gets.chomp
    @color_alleles[4] = color5
  end
end

def decode_new_genome
  genome = Genome.new
  # genome.species
  # genome.wind
  # genome.fur
  # if genome.wind_alleles != %w[N S]
  #   genome.colors
  # else
  #   genome.watercolor_colors
  # end
  genome.color_num('standard')
  puts "Your not cat's genetic string is:"
  puts genome.genome_string
end

# decode_new_genome
print_color_options(WC_COLORS)
