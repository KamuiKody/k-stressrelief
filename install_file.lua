
local QBCore = exports['qb-core']:GetCoreObject()
local resourceName = GetCurrentResourceName()
local sourceDirectory = GetResourcePath(resourceName) .."/images/"
local inventoryImagePath = GetResourcePath('qb-inventory').."/html/images/"

local function printColored(text, colorCode)
    print(colorCode .. text .. "\27[0m")
end

local function fileExists(filePath)
    local file = io.open(filePath, "rb")
    if file then file:close() return true end
    return false
end

function CopyFile(sourcePath, destinationPath)
    destinationPath = destinationPath:gsub("//", "/")
    if not fileExists(sourcePath) then
        if Config.DebugInstall then
            return printColored("Source file does not exist:  ".. sourcePath, "\27[31m")
        else
            return
        end
    end

    if fileExists(destinationPath) then return end

    local sourceFile = io.open(sourcePath, "rb")
    if not sourceFile then 
        if Config.DebugInstall then
            return printColored("Error opening source file: ".. sourcePath, "\27[31m")
        else
            return
        end
    end

    local destinationFile = io.open(destinationPath, "wb")
    if not destinationFile then
        sourceFile:close()
        if Config.DebugInstall then
            return printColored("Error opening destination file: ".. destinationPath, "\27[31m")
        else
            return
        end
    end

    local content = sourceFile:read("*a")
    destinationFile:write(content)

    sourceFile:close()
    destinationFile:close()

    if fileExists(destinationPath) then return printColored("File successfully copied to ".. destinationPath, "\27[32m") end
    if Config.DebugInstall then printColored("Error: File not copied to ".. destinationPath, "\27[31m") end
end

AddEventHandler('onResourceStart', function(resource)
    if resource ~= resourceName then return end
    for k, v in pairs(Config.Items) do
        local sourcePath = sourceDirectory .. v.image
        local destinationPath = inventoryImagePath .. v.image
        copyFile(sourcePath, destinationPath)
    end
end)
