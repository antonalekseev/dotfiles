"""
Configuration example for ``ptpython``.

Copy this file to ~/.ptpython/config.py
"""
from __future__ import unicode_literals
from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.keys import Keys
import os

__all__ = ("configure",)


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """

    # Vi mode.
    repl.vi_mode = True
    repl.vi_start_in_navigation_mode = True
    repl.vi_keep_last_used_mode = True

    # History Search.
    # When True, going back in history will filter the history on the records
    # starting with the current input. (Like readline.)
    # Note: When enable, please disable the `complete_while_typing` option.
    #       otherwise, when there is a completion available, the arrows will
    #       browse through the available completions instead of the history.
    repl.enable_history_search = False

    # Enable open-in-editor. Pressing C-X C-E in emacs mode or 'v' in
    # Vi navigation mode will open the input in the current editor.
    repl.enable_open_in_editor = True

    # Ask for confirmation on exit.
    repl.confirm_exit = False

    # Enable input validation. (Don't try to execute when the input contains
    # syntax errors.)
    repl.enable_input_validation = True

    # Set colour scheme for hotkey window
    if os.environ.get("ITERM_PROFILE") == "Hotkey Window":
        repl.use_code_colorscheme("paraiso-dark")

    # Use C-K, C-J to navigate history in the Insert mode
    @repl.add_key_binding(Keys.ControlK, filter=ViInsertMode())
    def _(event):
        event.current_buffer.auto_up()

    @repl.add_key_binding(Keys.ControlJ, filter=ViInsertMode())
    def _(event):
        event.current_buffer.auto_down()
