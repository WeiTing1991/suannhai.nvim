local M = {}

local passed = 0
local failed = 0
local current_describe = ""

function M.describe(name, fn)
  current_describe = name
  print("\n" .. name)
  fn()
end

function M.it(name, fn)
  local ok, err = pcall(fn)
  if ok then
    passed = passed + 1
    print("  PASS: " .. name)
  else
    failed = failed + 1
    print("  FAIL: " .. name)
    print("    " .. tostring(err))
  end
end

local function deep_equal(a, b)
  if type(a) ~= type(b) then
    return false
  end
  if type(a) ~= "table" then
    return a == b
  end
  for k, v in pairs(a) do
    if not deep_equal(v, b[k]) then
      return false
    end
  end
  for k, v in pairs(b) do
    if not deep_equal(v, a[k]) then
      return false
    end
  end
  return true
end

function M.assert_eq(actual, expected)
  if not deep_equal(actual, expected) then
    error("Expected: " .. vim.inspect(expected) .. "\n    Got:      " .. vim.inspect(actual), 2)
  end
end

function M.assert_true(value)
  if not value then
    error("Expected truthy, got: " .. vim.inspect(value), 2)
  end
end

function M.assert_nil(value)
  if value ~= nil then
    error("Expected nil, got: " .. vim.inspect(value), 2)
  end
end

function M.assert_type(value, expected_type)
  if type(value) ~= expected_type then
    error("Expected type " .. expected_type .. ", got: " .. type(value), 2)
  end
end

function M.report()
  print("\n" .. string.rep("-", 40))
  print(string.format("Results: %d passed, %d failed", passed, failed))
  if failed > 0 then
    os.exit(1)
  end
end

return M
