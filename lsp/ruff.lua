return {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", "ruff.toml", ".ruff.toml", ".git" },
    flags = { debounce_text_changes = 300 },
    -- https://docs.astral.sh/ruff/
    settings = {
        line_length = 80,
    },
}
