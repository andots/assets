-- darkmodern.nvim — colorscheme showcase
-- AI-generated code for colorscheme highlighting demonstration only.
-- No functional guarantees. Not intended for production use.

local GREETING = "Hello, World!"

-- Item constructor
local function make_item(id, weight, label)
  return { id = id, weight = weight, label = label }
end

--- Compute the sum of a numeric table.
--- @param values table
--- @return number
local function checksum(values)
  local sum = 0
  for _, v in ipairs(values) do
    sum = sum + v
  end
  return sum
end

--- Format an item as a readable string.
--- @param item table
--- @return string
local function describe(item)
  return string.format("[%d] %-8s (%.2f)", item.id, item.label, item.weight)
end

local function main()
  local items = {
    make_item(1, 1.5, "alpha"),
    make_item(2, 2.0, "beta"),
    make_item(3, 0.75, "gamma"),
  }

  local values = { 10, 20, 30, 40, 50 }
  local total = checksum(values)

  if total > 100 then
    print(GREETING)
  else
    print(string.format("sum = %d", total))
  end

  local labels = {
    alpha = 1.5,
    beta = 2.0,
    gamma = 0.75,
  }

  for key, val in pairs(labels) do
    print(string.format("  %-8s => %.2f", key, val))
  end

  for _, item in ipairs(items) do
    if item.weight > 1.0 then
      print(describe(item))
    end
  end
end

main()
