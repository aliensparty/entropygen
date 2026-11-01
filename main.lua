math.randomseed(os.time())

local passwordCount
local password

local function readLineFromFile(filename, wantedLine)
    local file = io.open(filename, 'r')
    local currentLine = 0
    local lineText = nil

    for line in file:lines() do
        currentLine = currentLine + 1
        if wantedLine == currentLine then
            lineText = line
            break
        end
    end

    file:close()
    return lineText
end

print("entropygen: the world's worst password generator\n")
print("how many passwords will you like to generate? (minimum 1)")
passwordCount = tonumber(io.read())

for i = 1, passwordCount do
    password = ""
    local subject = readLineFromFile("wordbank/adjectives.txt", math.random(1, 1347)) .. "-" .. readLineFromFile("wordbank/nouns.txt", math.random(1, 1525))
    local verb = readLineFromFile("wordbank/adverbs.txt", math.random(1, 10000)) .. "-" .. readLineFromFile("wordbank/verbs.txt", math.random(1, 9999))
    local object = readLineFromFile("wordbank/nouns.txt", math.random(1, 1525))

    local words = {subject, verb, object}

    for i = 1, #words do
        local choice = math.random(1, #words)
        local word = table.remove(words, choice)

        if i == 1 then
            password = password .. word
        else
            password = password .. "-" .. word
        end
    end

    print("password " .. i .. ": " .. password:gsub("^%l", string.upper) .. ".")
end