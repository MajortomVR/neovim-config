return {
    settings = {
        sqls = {
            connections = {
                {
                    driver = 'sqlite3',
                    -- Absolute path ensures it resolves flawlessly every single time
                    dataSourceName = vim.fn.getcwd() .. '/database.db', 
                },
            },
        },
    },
}
