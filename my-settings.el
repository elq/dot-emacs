
;;start emacs-server so I can set my prefered visual to emacsclient
(server-start)


;; Use only spaces for indentation (default is tab mixed with spaces)
(setq-default indent-tabs-mode nil)


;; the windowing system tends to use M/alt tab... so make C-tab do the same thing.
(global-set-key [C-tab] [M-tab])

;; Set the frame's title. %b is the name of the buffer. %+ indicates the
;; state of the buffer: * if modified, % if read only, or - otherwise.
;; Two of them to emulate the mode line. %f for the file name
;; (absolute path actually).
(setq frame-title-format "Emacs: %b %+%+ %f")

(setq backup-by-copying t ;; don't clobber symlinks
      backup-directory-alist
      '(("." . "~/.emacs.d/autosaves/")) ;; don't litter
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t) ;; use versioned backups


(setq-default ispell-program-name "aspell")
(setq inhibit-startup-message t)

;; highlight matches from searches
(setq isearch-highlight t)
(setq search-highlight t)
(setq-default transient-mark-mode t)

;;syntax hilighting is teh roxors
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))


;;no more yes-or-no questions please...
(fset 'yes-or-no-p 'y-or-n-p)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))


;; works well on my 17" hi-res macbook pro
(setq initial-frame-alist '((top . 1) (left . 1) (width . 250) (height . 80)))


(provide 'my-settings)