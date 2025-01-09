# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

species_names = ["Not Cat", "Mercat"]
species_names.each { |name| Species.find_or_create_by!(name: name) }

Wind.find_or_create_by!(name: "North", allele_1: "N", allele_2: "?")
Wind.find_or_create_by!(name: "North", allele_1: "N", allele_2: "N")
Wind.find_or_create_by!(name: "North", allele_1: "N", allele_2: "O")
Wind.find_or_create_by!(name: "South", allele_1: "S", allele_2: "?")
Wind.find_or_create_by!(name: "North", allele_1: "S", allele_2: "S")
Wind.find_or_create_by!(name: "North", allele_1: "S", allele_2: "O")
Wind.find_or_create_by!(name: "Trade", allele_1: "N", allele_2: "S")
Wind.find_or_create_by!(name: "Null", allele_1: "O", allele_2: "O")

Fur.find_or_create_by!(name: "Shorthair", allele_1: "S", allele_2: "?")
Fur.find_or_create_by!(name: "Shorthair", allele_1: "S", allele_2: "S")
Fur.find_or_create_by!(name: "Shorthair", allele_1: "S", allele_2: "L")
Fur.find_or_create_by!(name: "Longhair", allele_1: "L", allele_2: "L")
