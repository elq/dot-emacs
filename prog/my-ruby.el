;;-----------------------------------------------------------
;;ruby
;;-----------------------------------------------------------

(require 'rubydb)
(require 'rails)
(require 'yaml-mode)
(require 'rcov)
;;(require 'autotest)

(autoload 'ruby-mode "ruby-mode" "Ruby editing mode." t)

(modify-coding-system-alist 'file "\\.rb$" 'utf-8)
(modify-coding-system-alist 'file "\\.rhtml$" 'utf-8)


(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
			(save-excursion
			  (untabify (point-min) (point-max))
			  (delete-trailing-whitespace)
			  )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "IMENU")
            ))


;; Alignment
(add-to-list 'align-rules-list
             '(ruby-comma-delimiter
               (regexp . ",\\(\\s-*\\)[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))
(add-to-list 'align-rules-list
             '(ruby-hash-literal
               (regexp . "\\(\\s-*\\)=>\\s-*[^# \t\n]")
               (repeat . t)
               (modes  . '(ruby-mode))))


;;--- yaml ----
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(define-key yaml-mode-map "\C-m" 'newline-and-indent)

(add-hook 'yaml-mode-hook
          '(lambda ()
	    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(provide 'my-ruby)