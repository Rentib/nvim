local present, transparent = pcall(require, "transparent")

if not present then
  return
end

local options = {
  enable = true,
}

transparent.setup(options)
