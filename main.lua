local wordbank = require("wordbank")

local passwordCount
local wordCount
local rand
local password

print("entropygen: the world's worst password generator\n")
print("how many passwords will you like to generate? (minimum 1)")
passwordCount = io.read()
print("how many words shall each password generate? (minimum 1)")
wordCount = io.read()

for i = 1, passwordCount do
    rand = math.random(1, 983)
    password = wordbank[rand]
    for i = 1, wordCount do
        rand = math.random(1, 983)
        password = password .. "-" .. wordbank[rand]
    end
    print("password " .. i .. ": " .. password)
end