#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Helper utilities to format javascript snippets.
"""

ALWAYS = 'always'
NEVER = 'never'


def get_option(snip, option, default=None):
    return snip.opt(f'g:ultisnips_javascript["{option}"]', default)


def semi(snip):
    option = get_option(snip, 'semi', ALWAYS)

    return '' if option == NEVER else ';'


def space_before_function_paren(snip):
    option = get_option(snip, 'space-before-function-paren', NEVER)

    return '' if option == NEVER or option != ALWAYS else ' '


def keyword_spacing(snip):
    option = get_option(snip, 'keyword-spacing', ALWAYS)

    return '' if option == NEVER or option != ALWAYS else ' '
