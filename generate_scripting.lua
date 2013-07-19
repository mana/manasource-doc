#!/usr/bin/env lua

local function checkenv(varname)
    local value = os.getenv(varname)
    if not value then
        error(varname .. ' not set')
    end 
    return value
end

local SERVER_DIR = checkenv("SERVER_DIR")
local DOCS_DIR = checkenv("DOCS_DIR")

local FILES = {
    SERVER_DIR .. "/src/scripting/lua.cpp",
    SERVER_DIR .. "/scripts/lua/libmana.lua"
}

function string.starts(input, start)
    return string.sub(input, 1, string.len(start)) == start
end

local function parse_header(target_table, input)
    local line = input:read()
    while not (line == " **" or line == "---") do
        if line == " */" or not line then
            return false
        end
        line = line:gsub("^ ?[%-]?[%-%*] ?(.*)", "%1")
        target_table[#target_table + 1] = line
        line = input:read()
    end
    return true
end

local function parse_body(target_table, input)
    assert(target_table)
    
    local line = input:read()
    while line:starts(" *") or line:starts("--") do
        if not line then
            return false
        end
        -- For c++ comments stop here
        if line == " */" then
            break
        end
        line = line:gsub("^ ?[%-%*]+ ?(.*)", "%1")
        target_table[#target_table + 1] = line
        line = input:read()
    end
    return true
end

-- Parse
local categories = {}
local categories_by_name = {}
for _, inputname in ipairs(FILES) do
    local input = assert(io.open(inputname))
    local line = input:read()
    while line do
        if line:starts("/** LUA_CATEGORY") or line:starts("--- LUA_CATEGORY") then
            local category, shortname = line:match("LUA_CATEGORY (.+) %((.+)%)$")
            if not category or not shortname then
                error("Error at line: " .. line)
            end
            categories[shortname] = categories[shortname] or { members={} }
            categories[shortname].name = category
            categories[shortname].body = {}
            categories_by_name[#categories_by_name + 1] = {name=category,
                                                           tag=shortname}
            
            assert(parse_body(categories[shortname].body, input))
        elseif line:starts("/** LUA ") or line:starts("--- LUA ") then
            local name, category = line:match("LUA (.+) %((.+)%)$")

            if not name or not category then
                error("Error at line: " .. line)
            end
            
            local category = categories[category]
            assert(category, "Category was not found before " .. name)
            category.members[name] = {}
            local current = category.members[name]
            category.members[name].header = {}
            category.members[name].body = {}

            assert(parse_header(category.members[name].header, input))
            assert(parse_body(category.members[name].body, input))
        end
        line = input:read()
    end
    input:close()
end

table.sort(categories_by_name, function(lhs, rhs)
    return lhs.name < rhs.name
end)

-- Write
local output = assert(io.open(DOCS_DIR .. "/scripting.md", "w"))
local template = assert(io.open(DOCS_DIR .. "/scripting.in.md", "r"))
local template_line = template:read()
while template_line do
    if template_line == "{{body}}" then
        for _, category in ipairs(categories_by_name) do
            output:write("## " .. category.name .. "\n")
            output:write(table.concat(categories[category.tag].body, "\n") .. "\n")

            -- Convert to indexed table to allow sort
            local counter = 1
            local indexed_table = {}
            for name, _ in pairs(categories[category.tag].members) do
                indexed_table[counter] = name
                counter = counter + 1
            end
            table.sort(indexed_table)

            for _, name in ipairs(indexed_table) do
                output:write("### " .. name .. "\n")
                output:write("{% highlight lua %}\n")
                output:write(table.concat(categories[category.tag].members[name].header, "\n") .. "\n")
                output:write("{% endhighlight %}\n")
                output:write(table.concat(categories[category.tag].members[name].body, "\n") .. "\n")
            end
        end
    else
        output:write(template_line .. "\n")
    end

    template_line = template:read()
end

output:close()
template:close()
