local wordbank = require("wordbank")

local passwordCount
local wordCount
local rand
local password

print("entropygen: the world's worst password generator\n")
print("how many passwords will you like to generate? (minimum 1)")
passwordCount = tonumber(io.read())
print("how many words shall each password generate? (aim for 5-10)")
wordCount = tonumber(io.read())

for passwords = 1, passwordCount do
    rand = math.random(1, 983)
    password = wordbank[rand]
    for words = 2, wordCount do -- first word genned lol
        rand = math.random(1, 983)
        password = password .. "-" .. wordbank[rand]
    end
    print("password " .. passwords .. ": " .. password)
end