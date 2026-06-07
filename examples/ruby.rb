# darkmodern.nvim — colorscheme showcase
# AI-generated code for colorscheme highlighting demonstration only.
# No functional guarantees. Not intended for production use.

require 'ostruct'

GREETING  = "Hello, World!"
MAX_COUNT = 5

# Represents a weighted item.
Item = Struct.new(:id, :weight, :label, keyword_init: true) do
  def describe
    format("[%d] %-8s (%.2f)", id, label, weight)
  end
end

# Compute the sum of a numeric array.
# @param values [Array<Integer>]
# @return [Integer]
def checksum(values)
  values.reduce(0) { |sum, v| sum + v }
end

def main
  items = [
    Item.new(id: 1, weight: 1.5,  label: "alpha"),
    Item.new(id: 2, weight: 2.0,  label: "beta"),
    Item.new(id: 3, weight: 0.75, label: "gamma"),
  ]

  values = [10, 20, 30, 40, 50]
  total  = checksum(values)

  if total > 100
    puts GREETING
  else
    puts "sum = #{total}"
  end

  labels = {
    alpha: 1.5,
    beta:  2.0,
    gamma: 0.75,
  }

  labels.each do |key, val|
    printf("  %-8s => %.2f\n", key, val)
  end

  items
    .select { |item| item.weight > 1.0 }
    .map(&:describe)
    .each { |line| puts line }
end

main
