The options currently supported are:
   b   Beginning of line - A snippet with this option is expanded only if the
       tab trigger is the first word on the line. In other words, if only
       whitespace precedes the tab trigger, expand. The default is to expand
       snippets at any position regardless of the preceding non-whitespace
       characters.

   i   In-word expansion - By default a snippet is expanded only if the tab
       trigger is the first word on the line or is preceded by one or more
       whitespace characters. A snippet with this option is expanded
       regardless of the preceding character. In other words, the snippet can
       be triggered in the middle of a word.

   w   Word boundary - With this option, the snippet is expanded if
       the tab trigger start matches a word boundary and the tab trigger end
       matches a word boundary. In other words the tab trigger must be
       preceded and followed by non-word characters. Word characters are
       defined by the 'iskeyword' setting. Use this option, for example, to
       permit expansion where the tab trigger follows punctuation without
       expanding suffixes of larger words. This option overrides 'i'.

   r   Regular expression - With this option, the tab trigger is expected to
       be a python regular expression. The snippet is expanded if the recently
       typed characters match the regular expression. Note: The regular
       expression MUST be quoted (or surrounded with another character) like a
       multi-word tab trigger (see above) whether it has spaces or not. A
       resulting match is passed to any python code blocks in the snippet
       definition as the local variable "match". Regular expression snippets
       can be triggered in-word by default. To avoid this you can start your
       regex pattern with '\b', although this will not respect your
       'iskeyword' setting.

   t   Do not expand tabs - If a snippet definition includes leading tab
       characters, by default UltiSnips expands the tab characters honoring
       the Vim 'shiftwidth', 'softtabstop', 'expandtab' and 'tabstop'
       indentation settings. (For example, if 'expandtab' is set, the tab is
       replaced with spaces.) If this option is set, UltiSnips will ignore the
       Vim settings and insert the tab characters as is. This option is useful
       for snippets involved with tab delimited formats.

   s   Remove whitespace immediately before the cursor at the end of a line
       before jumping to the next tabstop.  This is useful if there is a
       tabstop with optional text at the end of a line.

   m   Trim all whitespaces from right side of snippet lines. Useful when
       snippet contains empty lines which should remain empty after expanding.
       Without this option empty lines in snippets definition will have
       indentation too.

   e   Custom context snippet - With this option expansion of snippet can be
       controlled not only by previous characters in line, but by any given
       python expression. This option can be specified along with other
       options, like 'b'. See |UltiSnips-custom-context-snippets| for more info.

   A   Snippet will be triggered automatically, when condition matches.
       See |UltiSnips-autotrigger| for more info.


