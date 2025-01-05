# frozen_string_literal: true

# creates genetic string for a not-cat
class GeneticString
  attr_reader :species

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

  def get_readable_string
    "[#{@species}]"
  end
end

def species
  puts 'What species is your not cat?'
  puts 'CAT (C) or MERCAT (M)'
  gets.chomp
end

# def determine_new_string
#   string = new GeneticString
# end

string = GeneticString.new
puts string.get_readable_string
