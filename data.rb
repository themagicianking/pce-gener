# frozen_string_literal: true

BLACK_GROUP = { "4": 'black', "3": 'chocolate', "2": 'brown', "1": 'tan' }.freeze
ORANGE_GROUP = { "4": 'red', "3": 'ginger', "2": 'orange', "1": 'apricot' }.freeze
GREY_GROUP = { "4": 'charcoal', "3": 'grey', "2": 'smoke', "1": 'silver' }.freeze
CREAM_GROUP = { "4": 'buff', "3": 'cream', "2": 'almond', "1": 'beige' }.freeze

COLORS = [BLACK_GROUP, ORANGE_GROUP, GREY_GROUP, CREAM_GROUP].freeze

BLACK_WC_GROUP = {
  "4": "#{BLACK_GROUP[:"4"]}-#{BLACK_GROUP[:"3"]}",
  "3": "#{BLACK_GROUP[:"3"]}-#{BLACK_GROUP[:"2"]}",
  "2": "#{BLACK_GROUP[:"2"]}-#{BLACK_GROUP[:"1"]}",
  "1": "#{BLACK_GROUP[:"1"]}-snow"
}.freeze

ORANGE_WC_GROUP = {
  "4": "#{ORANGE_GROUP[:"4"]}-#{ORANGE_GROUP[:"3"]}",
  "3": "#{ORANGE_GROUP[:"3"]}-#{ORANGE_GROUP[:"2"]}",
  "2": "#{ORANGE_GROUP[:"2"]}-#{ORANGE_GROUP[:"1"]}",
  "1": "#{ORANGE_GROUP[:"1"]}-snow"
}.freeze

GREY_WC_GROUP = {
  "4": "#{GREY_GROUP[:"4"]}-#{GREY_GROUP[:"3"]}",
  "3": "#{GREY_GROUP[:"3"]}-#{GREY_GROUP[:"2"]}",
  "2": "#{GREY_GROUP[:"2"]}-#{GREY_GROUP[:"1"]}",
  "1": "#{GREY_GROUP[:"1"]}-snow"
}.freeze

CREAM_WC_GROUP = {
  "4": "#{CREAM_GROUP[:"4"]}-#{CREAM_GROUP[:"3"]}",
  "3": "#{CREAM_GROUP[:"3"]}-#{CREAM_GROUP[:"2"]}",
  "2": "#{CREAM_GROUP[:"2"]}-#{CREAM_GROUP[:"1"]}",
  "1": "#{CREAM_GROUP[:"1"]}-snow"
}.freeze

WC_COLORS = [BLACK_WC_GROUP, ORANGE_WC_GROUP, GREY_WC_GROUP, CREAM_WC_GROUP].freeze
