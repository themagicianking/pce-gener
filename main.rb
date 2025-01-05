# frozen_string_literal: true

BLACK_GROUP = { "4": 'black', "3": 'chocolate', "2": 'brown', "1": 'tan' }.freeze
ORANGE_GROUP = { "4": 'red', "3": 'ginger', "2": 'orange', "1": 'apricot' }.freeze
GREY_GROUP = { "4": 'charcoal', "3": 'grey', "2": 'smoke', "1": 'silver' }.freeze
CREAM_GROUP = { "4": 'buff', "3": 'cream', "2": 'almond', "1": 'beige' }.freeze

COLORS = [BLACK_GROUP, ORANGE_GROUP, GREY_GROUP, CREAM_GROUP].freeze

# creates genetic string for a not-cat
class Genome
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

  def species
    puts 'What species is your not cat?'
    puts 'CAT (C) or MERCAT (M)'
    @species = gets.chomp
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
    @wind = winds[wind]
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
    @fur = furs[fur]
  end

  def check_recessive_longhair
    puts 'Put your not cat in the bean sandbox with a longhaired not cat.'
    puts 'Do any of the beans have long hair?'
    puts 'YES (Y) or NO (N)'
    gets.chomp == 'Y'
  end

  def color
    puts 'Is your cat in the orange group, the black group, snow, or albino?'
    puts "Orange group: #{ORANGE_GROUP.values.join(', ')}, #{CREAM_GROUP.values.join(', ')}"
    puts "Black group: #{BLACK_GROUP.values.join(', ')}, #{GREY_GROUP.values.join(', ')}"
    puts 'ORANGE (O), BLACK (B), SNOW (S) or ALBINO (A)'
    color1 = gets.chomp
    return unless %w[O B].include?(color1)

    visible_color(color1)
    dilute ? @color[2, 3] = %w[D D] : @color[2] = ['F']
  end

  def visible_color(color)
    @color[0] = color
    @color[1] = if color == 'O'
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

  def dilute
    puts 'Is your not cat dilute?'
    puts "Dilute colors: #{CREAM_GROUP.values.join(', ')}, #{GREY_GROUP.values.join(', ')}"
    puts 'YES (Y) or NO (N)'
    gets.chomp == 'Y'
  end

  def color_num
    puts "What is your cat's color number?"
  end
end

def print_color_table
  puts '|     1     |     2     |     3     |     4     |'
  puts '|-----------|-----------|-----------|-----------|'
  print_row(ORANGE_GROUP)
  puts '|-----------|-----------|-----------|-----------|'
  print_row(BLACK_GROUP)
  puts '|-----------|-----------|-----------|-----------|'
  print_row(CREAM_GROUP)
  puts '|-----------|-----------|-----------|-----------|'
  print_row(GREY_GROUP)
end

def print_row(colors)
  str = ''
  colors.each_value.reverse_each do |color|
    str = "#{str}#{' ' * (10 - color.length)}#{color} |"
  end
  puts "|#{str}"
end

def decode_new_genome
  genome = Genome.new
  # genome.species
  # genome.wind
  # genome.fur
  # genome.color
  print_color_table
  # puts "Your not cat's genetic string is:"
  # puts genome.genome_string
end

decode_new_genome
