;;setup my prefered c* mode styles
(require 'prog-modes)


;;-----------------------------------------------------------
;; snippets
;;-----------------------------------------------------------
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/elisp/vendor/yasnippet/snippets")
(setq yas/text-popup-function
      #'yas/dropdown-list-popup-for-template)

;;-----------------------------------------------------------
;; the emacs code browser
;;-----------------------------------------------------------
(defun start-ecb ()
  (interactive)
  (setq semantic-load-turn-everything-on t)
  ;;(setq semantic-load-turn-useful-things-on t)
  (load-file "~/elisp/vendor/cedet/common/cedet.el")

  (semantic-load-enable-excessive-code-helpers)
  ;;(load-file "~/elisp/cedet/speedbar/speedbar.el")
  (require 'semantic-load)
  (require 'ecb)
  (global-set-key (kbd "C-M-/") 'senator-completion-menu-popup)
  (global-set-key (kbd "M-<f1>") 'semantic-ia-fast-jump)
  (ecb-activate))



;;-----------------------------------------------------------
;;erlang
;;-----------------------------------------------------------

(add-to-list 'load-path "~/src/distel/elisp")
(require 'distel)
(distel-setup)
(require 'erlang)
(autoload 'erlang-mode "erlang-mode" "Erlang editing mode." t)
(add-to-list 'auto-mode-alist '("\\.erl$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.hrl$" . erlang-mode))

;; prevent annoying hang-on-compile
(defvar inferior-erlang-prompt-timeout t)
;; default node name to emacs@localhost
(setq inferior-erlang-machine-options '("-sname" "emacs"))
;; tell distel to default to that node
(setq erl-nodename-cache
      (make-symbol
       (concat
        "emacs@"
        ;; Mac OS X uses "name.local" instead of "name", this should work
        ;; pretty much anywhere without having to muck with NetInfo
        ;; ... but I only tested it on Mac OS X.
        (car (split-string (shell-command-to-string "hostname"))))))




;;-----------------------------------------------------------
;; ruby et al
;;-----------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.rhtml$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\(?:^\\|/\\)Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(autoload 'ruby-mode "my-ruby" nil t)




;;-----------------------------------------------------------
;; css stuff
;;-----------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(autoload 'css-mode "css-mode" nil t)


;;-----------------------------------------------------------
;; javascript
;;-----------------------------------------------------------
(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))
(autoload 'javascript-mode "my-javascript" t)


;;-----------------------------------------------------------
;; lua mode
;;-----------------------------------------------------------
(setq auto-mode-alist (cons '("\\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;;-----------------------------------------------------------
;; haskell stuff
;;-----------------------------------------------------------
(load "~/elisp/vendor/proglang/haskell/haskell-mode-2.1/haskell-site-file")
(eval-after-load "haskell-mode" 
  '(require 'my-haskell))

;;-----------------------------------------------------------
;; Lisp and Clojure
;;-----------------------------------------------------------

(push "~/src/slime/" load-path)

(require 'slime)
(slime-setup)

(setq slime-multiprocessing t)
(setq *slime-port* 4005)

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
;; ;; If you don't want eldoc-like behavior, comment out the following line
;; (slime-autodoc-mode)

(setq inferior-lisp-program "/opt/local/bin/sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-startup-animation nil)

(setq swank-clojure-jar-path "~/src/clojure/clojure.jar")
(add-to-list 'load-path "~/src/swank-clojure")
(require 'swank-clojure-autoload)
(setq swank-clojure-extra-vm-args (list '("-Xmx1G" 
					  "-server"
					 "-Dplatform.ListOfComponentsToInit="
					 "-Dnetflix.home=~/p4/cinematch/cm_v4_prize_integ/"
					 "-Dcom.netflix.cinematch.connectionPoolProperties=~/p4/cinematch/cm_v4_prize_integ/java/cmpool.properties"
					 "-Doracle.jdbc.V8Compatible=true"
					 "-Dcom.netflix.cinematch.prod_hosts=cmprod0,cmprod1,cmprod2,cmprod3,paprod0,qtprod0"
					 "-Dcom.netflix.cinematch.test_hosts=cmtest,patest:11998,qttest:10998")))

(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

(defun run-clojure ()
  "Starts clojure in Slime"
  (interactive)
  (slime 'clojure))





;;-----------------------------------------------------------
;;OCaml stuff
;;-----------------------------------------------------------
(setq auto-mode-alist (cons '("\\.ml\\w?" . tuareg-mode) auto-mode-alist))
(autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
(autoload 'camldebug "camldebug" "Run the Caml debugger" t)


;;-----------------------------------------------------------
;; XML crap... like violence
;;-----------------------------------------------------------
(set 'nxml-path "~/elisp/vendor/nxml-mode/")
(load (concat nxml-path "rng-auto.el"))
(add-to-list 'auto-mode-alist
             (cons (concat "\\." (regexp-opt '("xml" "xsd" "sch" "rng" "xslt" "svg" "rss") t) "\\'")
                   'nxml-mode))

(unify-8859-on-decoding-mode)

(setq magic-mode-alist
      (cons '("<\\?xml " . nxml-mode)
            magic-mode-alist))
(fset 'xml-mode 'nxml-mode)
(fset 'html-mode 'nxml-mode)


(provide 'languages)