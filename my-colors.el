
;;-----------------------------------------------------------
;; colors
;;-----------------------------------------------------------
(defun set-theme-to-vibrant-ink ()
  (interactive)
  (setq font-lock-maximum-decoration t)
 
  ;; set colors:
  (set-background-color "black")
  (set-foreground-color "white")
 
  (set-face-foreground font-lock-type-face "white")
  (set-face-foreground font-lock-comment-face "slate grey")
  (set-face-foreground font-lock-constant-face "dark cyan")
  (set-face-foreground font-lock-keyword-face "orange red") 
  (set-face-foreground font-lock-keyword-face "slate blue")
  (set-face-foreground font-lock-function-name-face "orange")
  (set-face-foreground font-lock-string-face "green")
 
  ;; I'm not sure how these should be set
 
  ;; block comment: dark violet
  ;; regex: cyan
  ;; (set-face-foreground font-lock-regexp-grouping-backslash "cyan")
)


;;colors... pretty colors
;;(add-to-list 'load-path "~/elisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-deep-blue)
;;(color-theme-subtle-hacker)
;;(color-theme-late-night)
(color-theme-charcoal-black)
;;(color-theme-midnight)
;;(color-theme-clarity)
;;(color-theme-hober)


(provide 'my-colors)