local tsv = require("Data.SKSE.DynamicDialogueReplacer.Scripts.AnyASCII")  -- TSV string contents

-- UTF-8 codepoint pattern (no utf8.* needed)
local CHARPAT = "[%z\1-\127\194-\244][\128-\191]*"

-- NOTE the double backslash before 'asdf...'
local ValidCharsString =
  "`1234567890-=~!@#$%^&*():_+QWERTYUIOP[]ASDFGHJKL;'\"ZXCVBNM,./qwertyuiop{}\\asdfghjklzxcvbnm<>?|" ..
  "¡¢£¤¥¦§¨©ª«®¯°²³´¶·¸¹º»¼½¾¿ÄÀÁÂÃÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖ×ØÙÚÛÜÝÞß" ..
  "àáâãäåæçèéêëìíîïðñòóôõö÷øùúûüýþ ÿ "

-- Build valid set
local valid = {}
for ch in ValidCharsString:gmatch(CHARPAT) do
  valid[ch] = true
end

-- Build replacement map from TSV; allow empty dst to delete chars; handle CRLF
local repl = {}
for src, dst in tsv:gmatch("([^\t\r\n]+)\t([^\r\n]*)") do
  if src ~= "" and dst ~= nil and not valid[src] then
    repl[src] = dst
  end
end

-- Replace per UTF-8 character
function replace(text)
  return (text:gsub(CHARPAT, function(ch)
    return repl[ch] or ch
  end))
end
