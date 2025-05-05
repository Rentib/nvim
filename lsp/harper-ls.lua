return {
    cmd = { "harper-ls", "--stdio" },
    filetypes = { "gitcommit", "typst" },
    root_markers = { ".git" },
    settings = {
        ["harper-ls"] = {
            userDictPath = "",
            fileDictPath = "",
            linters = {
                AnA = true,
                BoringWords = true,
                CorrectNumberSuffix = true,
                LinkingVerbs = false,
                LongSentences = true,
                Matcher = true,
                NoOxfordComma = false,
                RepeatedWords = true,
                SentenceCapitalization = true,
                Spaces = true,
                SpellCheck = true,
                SpelledNumbers = true,
                UnclosedQuotes = true,
                UseGenitive = true,
                WrongQuotes = false,
            },
            codeActions = {
                ForceStable = false,
            },
            markdown = {
                IgnoreLinkTitle = false,
            },
            diagnosticSeverity = "hint",
            isolateEnglish = true,
            dialect = "British", -- American/British
        }
    },
}
