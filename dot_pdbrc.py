def _pdbrc_init():
    import readline

    HISTFILE = ".pdbhistory"
    try:
        readline.read_history_file(HISTFILE)
    except IOError:
        pass
    import atexit

    atexit.register(readline.write_history_file, HISTFILE)
    readline.set_history_length(500)


_pdbrc_init()
del _pdbrc_init
