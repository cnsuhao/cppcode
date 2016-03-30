#
# linter.py
# Linter for SublimeLinter3, a code checking framework for Sublime Text 3
#
# Written by Aparajita Fishman
# Copyright (c) 2013 Aparajita Fishman
#
# License: MIT
#

"""This module exports the Lua plugin class."""

from SublimeLinter.lint import Linter, util


class Lua(Linter):

    syntax = 'lua'
    tempfile_suffix = '-'
    cmd = 'RogLuaChecker.exe @'
    regex = r'((?P<error>^Error)|(?P<warning>^Warning)):(?P<line>\d+):((?P<near>\D+?)|(?P<col>\d+?)):(?P<message>.+?)$'
