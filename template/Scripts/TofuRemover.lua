local tsv = require("AnyASCII")
local map = {}

local ValidCharsString = "`1234567890-=~!@#$%^&*():_+QWERTYUIOP[]ASDFGHJKL;'\"ZXCVBNM,./qwertyuiop{}\\asdfghjklzxcvbnm<>?|¡¢£¤¥¦§¨©ª«®¯°²³´¶·¸¹º»¼½¾¿ÄÀÁÂÃÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþ ÿ "


for line in string.gmatch(tsv, "([^\n]+)") do
  local row = {}
  local i = 1
  for field in string.gmatch(line, "([^\t]*)") do
    row[i] = field
    i = i + 1
  end

  -- skip if a valid character
  if not string.find(ValidCharsString, row[1], 1, true) then
    map[#map+1] = row
  end
end

function replace(text)
  return text:gsub(".", map)
end