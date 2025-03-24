databaseData = {
    ["username"] = "root",
    ["password"] = "",
    ["host"] = "127.0.0.1",
    ["dbName"] = "newmta",
}

local connection

function databaseConnection()
    connection = dbConnect( "mysql", "dbname="..databaseData["dbName"].."; host="..databaseData["host"]..";charset=utf8", databaseData["username"], databaseData["password"], "share=1" )

    if (connection) then
        outputChatBox("Adatbázis csatlakozás sikeres!", root, 255, 255, 255, true)
    else
        outputChatBox("Adatbázis csatlakozás sikertelen!", root, 255, 255, 255, true)
    end
end

databaseConnection()

function connectionExecute()
    if (connection) then
        return connection
    else
        return false
    end
end
