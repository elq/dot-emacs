;;really sub-par hack to support carbonized emacs.
;;
;;carbon emacs doesn't have an environment from my shell.. so.. lets setup a proper path
(setenv "PATH" (concat "/usr/local/bin:/opt/local/bin:/opt/local/mysql/bin:/opt/local/sbin:" (getenv "PATH")))
(add-to-list 'exec-path (getenv "PATH"))
(add-to-list 'exec-path "/bin")
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/mysql/bin")
(add-to-list 'exec-path "/opt/local/godi/bin")
(add-to-list 'exec-path "/opt/local/godi/sbin")
(add-to-list 'exec-path "~/bin")


;; display the current time
(display-time)

;; Show column number at bottom of screen
(column-number-mode 1)

;;I'm a lazy typist
(abbrev-mode 1)


(defun try-complete-abbrev (old)
  (if (expand-abbrev) t nil))

(setq hippie-expand-try-functions-list
      '(try-complete-abbrev
        try-complete-file-name
        try-expand-dabbrev))


(require 'mic-paren)
(paren-activate)
(require 'parenface)
(setf paren-priority 'close)


;;complete recently used words
(require 'completion)
(initialize-completions)

;; highlight the current line
(setq highline-face 'highlight)
(require 'highline)
;; Turn on local highlighting for Dired (C-x d)
(add-hook 'dired-after-readin-hook 'highline-on)
;; Turn on local highlighting for list-buffers (C-x C-b)
(defadvice list-buffers (after highlight-line activate)
  (save-excursion
    (set-buffer "*Buffer List*")
    (highline-on)))

(highline-on)
(highline-mode-on)


(autoload 'htmlize-buffer "htmlize" t)
(autoload 'htmlize-region "htmlize" t)

(autoload 'hide-lines "hide-lines" "Hide lines based on a regexp" t)
(global-set-key "\C-ch" 'hide-lines)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(autoload 'browse-kill-ring "browse-kill-ring" t)
(autoload 'kill-ring-search "kill-ring-search"
  "Search the kill ring in the minibuffer."
  (interactive))

(global-set-key "\M-\C-y" 'kill-ring-search)



;; org mode stuff
(setq auto-mode-alist (cons '("\\.org$" . org-mode) auto-mode-alist))

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(setq org-log-done t)

(setq org-tab-follow-link t)
(setq org-agenda-custom-commands
      '(("w" todo "WAITING" nil)
	("n" todo "NEXT" nil)
	("d" "Agenda + Next Actions" ((agenda) (todo "NEXT")))))

(add-to-list 'auto-mode-alist '("\\.textile$" . textile-mode))
(autoload 'textile-mode "textile-mode" t)

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.markdown" . markdown-mode) auto-mode-alist))



;;-----------------------------------------------------------
;; remember
;;-----------------------------------------------------------
(require 'remember-autoloads)
(setq remember-data-file "~/notes.txt")  ;; (2)
(global-set-key (kbd "C-c r") 'remember) ;; (3)



(provide 'my-generic)
