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
