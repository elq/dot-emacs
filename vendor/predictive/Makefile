
# Copyright (C) 2004-2008 Toby Cubitt

# Author: Toby Cubitt <toby-predictive@dr-qubit.org>
# Version: 0.4
# URL: http://www.dr-qubit.org/emacs.php

# This file is part of the Emacs Predictive Completion package.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
# MA 02110-1301, USA.



all: core dict-english dicts

clean:
	rm dict-english.el *.elc latex/*.elc # html/*.elc f90/*.elc

EMACS = emacs




# list of core elisp files
core_files := $(shell ls *.el | grep -v 'dict-english.el' | sed 's:\.el:\.elc:g')

# list of libraries to load
#elisp_libs = heap.el tstree.el dict.el predictive.el auto-overlays.el auto-overlay-word.el auto-overlay-line.el auto-overlay-self.el auto-overlay-stack.el

# lists of dictionaries
latex_dicts := $(shell ls latex/dict-*.word-list | sed 's:\.word-list:\.elc:g')
html_dicts := $(shell ls html/dict-*.word-list | sed 's:\.word-list:\.elc:g')
#f90_dicts := $(shell ls f90/dict-*.word-list | sed 's:\.word-list:\.elc:g')




# byte-compilation target
core: $(core_files)

# overrides implicit rules, since these require the dictionaries
predictive-latex.elc: predictive-latex.el $(latex-dicts)
	$(EMACS) --batch -L ./ -L ./latex/ -f batch-byte-compile $<
predictive-html.elc: predictive-html.el $(html-dicts)
	$(EMACS) --batch -L ./ -L ./html/ -f batch-byte-compile $<




# English dictionary target
dict-english: dict-english.elc

# overrides implicit rule for dictionaries, to create it from the .el file
dict-english.elc: dict-english.el
	$(EMACS) --batch -L ./ -f batch-byte-compile $<

# in case dict-english.el doesn't exist (should be included in package)
dict-english.el: dict-english.word-list dict-tree.el
	$(EMACS) --batch -L ./ --eval="(progn (require 'predictive) (setq dict-english (predictive-create-dict '$(basename $(notdir $@)) \"$(basename $@)\" \"$<\")) (dictree-write dict-english \"dict-english\" t))"




# dictionary targets
dicts: dict-english latex_dicts html_dicts # f90_dicts

latex_dicts: $(latex_dicts)

html_dicts: $(html_dicts)

#f90_dicts: $(f90_dicts)




# implicit rule for creating dictionaries
dict-%.elc: dict-%.word-list dict-tree.el
	$(EMACS) --batch -L ./ --eval="(progn (require 'predictive) (predictive-create-dict '$(basename $(notdir $@)) \"$(basename $@)\" \"$<\") (dictree-save-modified))"


# implicit rule for byte-compiling elisp files
%.elc: %.el
	$(EMACS) --batch -L ./ -f batch-byte-compile $<



test:
	echo $(core_files) $(dicts)
