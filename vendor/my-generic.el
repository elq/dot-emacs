

;;really sub-par hack to support carbonized emacs.
;;
;;carbon emacs doesn't have an environment from my shell.. so.. lets setup a proper path
(setenv "PATH" (concat "/opt/local/bin:/opt/local/mysql/bin:/opt/local/sbin:" (getenv "PATH")))
(add-to-list 'exec-path (getenv "PATH"))
(add-to-list 'exec-path "/bin")
(add-to-list 'exec-path "/usr/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/mysql/bin")
(add-to-list 'exec-path "/opt/local/godi/bin")
(add-to-list 'exec-path "/opt/local/godi/sbin")
(add-to-list 'exec-path "~/bin")


(setq-default ispell-program-name "aspell")


(define-key global-map "\C-co" 'ff-find-related-file)
(define-key global-map "\C-cp" 'ffap)



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




(require 'anything)
(require 'hide-lines)
(require 'remember)
;;setup my prefered c* mode styles
(require 'prog-modes)

