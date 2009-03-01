;;-----------------------------------------------------------
;;Haskell stuff...
;;-----------------------------------------------------------

(defun hoogle-lookup ()
  (interactive)
  (let (myword myurl myPos1 myPos2)
    (setq myword
	  (if (and transient-mark-mode mark-active)
	      (buffer-substring-no-properties (region-beginning) (region-end))
	      (save-excursion
                (skip-chars-backward "_A-Za-z")
                (setq myPos1 (point))
                (skip-chars-forward "_A-Za-z")
                (setq myPos2 (point))
                (buffer-substring-no-properties myPos1 myPos2))))
    (setq myurl (concat "http://www.haskell.org/hoogle/?q=" myword))
    (browse-url myurl)))

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
(add-hook 'haskell-mode-hook 
	  (lambda () 
	    (define-key haskell-mode-map (kbd "<f1>") 'hoogle-lookup)))


(defun haskell-unicode ()
  (interactive)
  (font-lock-mode 0)
  (substitute-patterns-with-unicode
   (list (cons "\\(<-\\)" 'left-arrow)
	 (cons "\\(->\\)" 'right-arrow)
	 (cons "\\(==\\)" 'identical)
	 (cons "\\(/=\\)" 'not-identical)
	 (cons "\\(()\\)" 'nil)
	 (cons "\\<\\(sqrt\\)\\>" 'square-root)
	 (cons " \\(&&\\) " 'logical-and)
	 (cons "\\(||\\)" 'logical-or)
	 (cons "\\<\\(not\\)\\>" 'logical-neg)
	 (cons "\\(>\\)\\[^=\\]" 'greater-than)
	 (cons "\\(<\\)\\[^=\\]" 'less-than)
	 (cons " \\(>=\\) " 'greater-than-or-equal-to)
	 (cons " \\(\\.\\) " 'ring)
	 (cons "\\(<=\\)" 'less-than-or-equal-to)
	 (cons "\\<\\(alpha\\)\\>" 'alpha)
	 (cons "\\<\\(beta\\)\\>" 'beta)
	 (cons "\\<\\(gamma\\)\\>" 'gamma)
	 (cons "\\<\\(delta\\)\\>" 'delta)
	 (cons "\\(''\\)" 'double-prime)
	 (cons "\\('\\)" 'prime)
	 (cons "\\(!!\\)" 'double-exclamation)
	 (cons "\\(\\\\\\)\\w" 'lambda)
	 (cons "\\(\\.\\.\\)" 'horizontal-ellipsis)))
  (font-lock-mode 1))



(defun unicode-symbol (name)
  "Translate a symbolic name for a Unicode character -- e.g., LEFT-ARROW
  or GREATER-THAN into an actual Unicode character code. "
  (decode-char 'ucs (case name
		      ;; arrows
		      ('left-arrow 8592)
		      ('up-arrow 8593)
		      ('right-arrow 8594)
		      ('down-arrow 8595)
  
		      ;; boxes
		      ('double-vertical-bar #X2551)
                        
		      ;; relational operators
		      ('equal #X003d)
		      ('not-equal #X2260)
		      ('identical #X2261)
		      ('not-identical #X2262)
		      ('less-than #X003c)
		      ('greater-than #X003e)
		      ('less-than-or-equal-to #X2264)
		      ('greater-than-or-equal-to #X2265)
  
		      ;; logical operators
		      ('logical-and #X2227)
		      ('logical-or #X2228)
		      ('logical-neg #X00AC)
  
		      ;; misc
		      ('nil #X2205)
		      ('horizontal-ellipsis #X2026)
		      ('double-exclamation #X203C)
		      ('prime #X2032)
		      ('double-prime #X2033)
		      ('for-all #X2200)
		      ('there-exists #X2203)
		      ('element-of #X2208)
  
		      ;; mathematical operators
		      ('square-root #X221A)
		      ('squared #X00B2)
		      ('cubed #X00B3)
		      ('ring #X2218)
  
		      ;; letters
		      ('lambda #X03BB)
		      ('alpha #X03B1)
		      ('beta #X03B2)
		      ('gamma #X03B3)
		      ('delta #X03B4))))
                        
(defun substitute-pattern-with-unicode (pattern symbol)
  "Add a font lock hook to replace the matched part of PATTERN with the 
  Unicode symbol SYMBOL looked up with UNICODE-SYMBOL."
  (interactive)
  (font-lock-add-keywords
   nil `((,pattern (0 (progn (compose-region (match-beginning 1) (match-end 1)
					     ,(unicode-symbol symbol))
			     nil))))))
  
(defun substitute-patterns-with-unicode (patterns)
  "Call SUBSTITUTE-PATTERN-WITH-UNICODE repeatedly."
  (mapcar #'(lambda (x)
	      (substitute-pattern-with-unicode (car x)
					       (cdr x)))
	  patterns))

  
(add-hook 'haskell-mode 'haskell-unicode)


(provide 'my-haskell)