python3 << endpy
import os

import vim


def branch_ticket():
    git_head_info = os.popen('git rev-parse --abbrev-ref HEAD').read().rstrip("\n\r")
    if git_head_info.startswith('WEB-'):
        lineno, _ = vim.current.window.cursor 
        current_line = vim.current.line

        first_non_space_char_pos = len(current_line) - len(current_line.lstrip())
        vim.current.buffer[lineno - 1] = (
            f"{' '*first_non_space_char_pos}{git_head_info[:8]} {current_line.lstrip()}"
        )
    else:
        print('not a ticket format')
endpy
