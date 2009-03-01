;; c-mode
(when (fboundp 'c-mode)
  (add-to-list 'auto-mode-alist '("\\.c\\'" . c-mode))
  (add-to-list 'auto-mode-alist '("\\.h\\'" . c-mode)))



(add-hook 'c-mode-common-hook
	  (lambda () (c-toggle-hungry-state 1)))

(when (fboundp 'c-add-style)
  (setq c-default-style "FreeBSD")
  (c-add-style "k&r-four" '("k&r" (c-basic-offset . 4)))
  (c-add-style "svn" '("gnu" (c-offsets-alist . ((inextern-lang . 0)))))
  (c-add-style "FreeBSD"
	       '("bsd"
		 (c-basic-offset . 4)
		 (defun-block-intro . 4)
		 (statement-block-intro . 4)
		 (statement-case-intro . 4)
		 (substatement-open . 4)
		 (substatement . 4)
		 (arglist-cont-nonempty . 4)
		 (inclass . 4)
		 (knr-argdecl-intro . 4)))
  (c-add-style "eay"
	       '((c-basic-offset . 4)
		 (c-comment-only-line-offset . 0)
		 (c-hanging-braces-alist)
		 (c-offsets-alist . ((defun-open . +)
				     (defun-block-intro . 0)
				     (class-open . +)
				     (class-close . +)
				     (block-open . 0)
				     (block-close . 0)
				     (substatement-open . +)
				     (statement . 0)
				     (statement-block-intro . 0)
				     (statement-case-open . +)
				     (statement-case-intro . +)
				     (case-label . -)
				     (label . -)
				     (arglist-cont-nonempty . +)
				     (topmost-intro . -)
				     (brace-list-close . +)
				     (brace-list-intro . +)))))
  (c-add-style "NetBSD"
	       '((comment-column . 40)
		 (c-basic-offset . 8)
		 (c-comment-only-line-offset . 0)
		 (c-hanging-comment-starter-p . nil)
		 (c-hanging-comment-ender-p . nil)
		 (c-offsets-alist . ((statement-block-intro . +)
				     (knr-argdecl-intro . +)
				     (substatement-open . 0)
				     (label . 0)
				     ;; ???
				     (topmost-intro-cont
				      . netbsd-nkf-topmost-intro-cont)
				     (statement . netbsd-knf-lineup-statement)
				     (statement-cont
				      . netbsd-knf-lineup-statement-cont)
				     (arglist-cont-nonempty
				      . netbsd-knf-arglist-cont-nonempty)
				     (arglist-close
				      . netbsd-knf-arglist-cont-nonempty))))))

(defun netbsd-knf-after-for-loop-p (pos)
  "True if POS is just after `for ('"
  (save-excursion
    (goto-char pos)
    (condition-case ()
	(progn (forward-char -5)	; (- (length "for ("))
	       (looking-at "\\bfor ("))
      (goto-char (point-min)))))

(defun netbsd-knf-lineup-statement (langelem)
  "Lineup statement with handling continuation line in for-loop condition."
  (cond ((netbsd-knf-after-for-loop-p (cdr langelem))
	 ;; -1 == 4 - 5 == `desired indent level' - `length of "for ("'
	 ;; and desired indent level == (/ c-basic-offset 2)
	 -1)
	(t 0)))

(defun netbsd-knf-lineup-statement-cont (langelem)
  "Lineup statement-cont with handling continuation line in for-loop\n\
condition."
  (cond ((netbsd-knf-after-for-loop-p (cdr langelem))
	 -1)
	;; 4 == (/ c-basic-offset 2)
	(t 4)))

(defun netbsd-knf-arglist-cont-nonempty (langelem)
  (cond ((save-excursion (goto-char (cdr langelem)) (bolp))
	 (save-excursion
	   (let ((eol (progn
			(goto-char (cdr langelem))
			(end-of-line)
			(point))))
	     (goto-char (cdr langelem))
	     (if (search-forward "\t" eol t)
		 (+ (current-column) (/ c-basic-offset 2))
	       (/ c-basic-offset 2)))))
	(t (/ c-basic-offset 2))))

(defun netbsd-nkf-topmost-intro-cont (langelem)
  (save-excursion
    (let ((base (save-excursion (goto-char (cdr langelem)) (current-column))))
      (back-to-indentation)
      (- (current-column) base))))

(add-hook 'c-mode-hook
	  (lambda ()
	    ;;(setq indent-tabs-mode t)
	    (setq tab-width 84)))


(provide 'prog-modes)