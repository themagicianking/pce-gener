# frozen_string_literal: true

require './data'

def print_color_table(color_type)
  puts '      1     |     2     |     3     |     4      '
  color_type.each do |color_group|
    puts ' -----------|-----------|-----------|----------- '
    print_row(color_group)
  end
  puts ' -----------------------------------------------'
end

def print_row(colors)
  str = ''
  colors.each_value.reverse_each do |color|
    str = "#{str}#{' ' * (10 - color.length)}#{color} |"
  end
  puts "|#{str}"
end

def print_color_options(color_type)
  puts "Orange group: #{color_type[1].values.join(', ')}, #{color_type[3].values.join(', ')}"
  puts "Black group: #{color_type[0].values.join(', ')}, #{color_type[2].values.join(', ')}"
end

# def print_dilute_options(color_type)
#   if color_type == 'standard'
#     puts "Dilute colors: #{CREAM_GROUP.values.join(', ')}, #{GREY_GROUP.values.join(', ')}"
#   else
#     puts 'placeholder'
#   end
# end
