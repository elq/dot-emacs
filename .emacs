;;(setq debug-on-error t)

(require 'cl)

(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
    (let* ((my-lisp-dir "~/elisp/")
           (default-directory my-lisp-dir))
      (setq load-path (cons my-lisp-dir load-path))
      (normal-top-level-add-subdirs-to-load-path)))


;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(require 'epa-setup)
(epa-file-enable)


(require 'my-settings)
(require 'my-generic)
(require 'my-keymaps)
(require 'my-fonts)
(require 'my-colors)
(require 'languages)
(require 'my-blog)


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(company-display-style (quote tooltip))
 '(ecb-layout-window-sizes (quote (("left8" (0.26136363636363635 . 0.2835820895522388) (0.26136363636363635 . 0.23880597014925373) (0.26136363636363635 . 0.29850746268656714) (0.26136363636363635 . 0.16417910447761194)))))
 '(ecb-options-version "2.33beta1")
 '(haskell-program-name "ghci")
 '(highline-face (quote highlight))
 '(ido-mode (quote buffer) nil (ido))
 '(org-todo-keywords (quote ((sequence "TODO" "DONE" "NEXT" "WAITING" "INPROGRESS"))))
 '(rails-always-use-text-menus nil)
 '(rails-ri-command "fri")
 '(rails-ws:default-server-type "mongrel")
 '(safe-local-variable-values (quote ((c++-font-lock-extra-types "\\sw+_t" "lua_[A-Z]\\sw*[a-z]\\sw*") (c-font-lock-extra-types "\\sw+_t" "lua_[A-Z]\\sw*[a-z]\\sw*") (time-stamp-active . t))))
 '(semanticdb-global-mode t nil (semanticdb))
 '(weblogger-config-alist (quote (("default" ("user" . "admin") ("server-url" . "http://blog.whoop.as/xmlrpc.php") ("weblog" . "1")))))
 '(which-function-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-default-highlight-face ((((class color) (background dark)) (:background "gray32"))))
 '(highlight ((t (:background "slateblue4")))))
