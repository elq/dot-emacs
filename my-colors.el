
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


(defun color-theme-troll-goo ()
  (interactive)
  (color-theme-install
   '(color-theme-troll-goo
     ((background-color . "#1d1f20")
      (background-mode . light)
      (border-color . "#211c1c")
      (cursor-color . "#d9d3a0")
      (foreground-color . "#ddcfbb")
      (mouse-color . "black"))
     (fringe ((t (:background "#211c1c"))))
     (mode-line ((t (:foreground "#eeeeec" :background "#555753"))))
     (region ((t (:background "#3b4a87"))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#c0d695"))))
     (font-lock-function-name-face ((t (:foreground "#ddd8b1"))))
     (font-lock-keyword-face ((t (:foreground "#d8dbee"))))
     (font-lock-string-face ((t (:foreground "#b9b0ba"))))
     (font-lock-type-face ((t (:foreground"#94b177"))))
     (font-lock-variable-name-face ((t (:foreground "#d1d194"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (font-lock-warning-face ((t (:foreground "Red" :bold t))))
     )))
(provide 'color-theme-troll-goo)

;;colors... pretty colors
;;(add-to-list 'load-path "~/elisp/color-theme")
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-deep-blue)
;;(color-theme-subtle-hacker)
;;(color-theme-late-night)
;;(color-theme-charcoal-black)
(color-theme-troll-goo)
;;(color-theme-midnight)
;;(color-theme-clarity)
;;(color-theme-hober)


(provide 'my-colors)