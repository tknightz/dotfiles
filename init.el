;; Package configs
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives '(("org"   . "http://orgmode.org/elpa/")
                         ("gnu"   . "http://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; PATH
(let ((path (shell-command-to-string ". ~/.bash_profile; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path 
        (append
         (split-string-and-unquote path ":")
         exec-path)))

;; Some term enhancement
(defadvice term-sentinel (around my-advice-term-sentinel (proc msg))
  (if (memq (process-status proc) '(signal exit))
      (let ((buffer (process-buffer proc)))
        ad-do-it
        (kill-buffer buffer))
    ad-do-it))
(ad-activate 'term-sentinel)

(defadvice ansi-term (before force-bash)
  (interactive (list "/bin/bash")))
(ad-activate 'ansi-term)


;; Other configs
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Splash Screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message ";; Happy Hacking")

;; Show matching parens
(setq show-paren-delay 0)
(show-paren-mode  1)

;; Paragraph movement
(global-set-key (kbd "s-j") 'forward-paragraph)
(global-set-key (kbd "s-k") 'backward-paragraph)

;; Keybinding for term mode
(add-hook 'term-mode
          (lambda () (global-set-key (kbd "s-v") 'term-paste)))

;; OrgMode Configs
(add-to-list 'load-path "~/.emacs.d/org-mode/")
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))


(setq org-html-validation-link nil)
(setq org-todo-keywords
      '((sequence "TODO" "WORKING" "HOLD" "|" "DONE" "CANCEL")))
(setq org-todo-keyword-faces
      '(("TODO"    . (:foreground "magenta" :background "gray10"))
	("WORKING" . (:foreground "spring green" :background "gray10"))
	("HOLD"    . (:foreground "orange red" :background "gray10"))
	("DONE"    . (:foreground "lawn green" :background "gray10"))
	("CANCEL"  . (:foreground "dark red" :background "gray10"))))

(add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
(add-hook 'org-mode-hook 'turn-on-auto-fill)
(setq org-hide-emphasis-markers t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-document-info ((t (:inherit outline-1 :height 1.2))))
 '(org-document-info-keyword ((t (:inherit outline-1 :height 1.2))))
 '(org-document-title ((t (:inherit outline-1 :height 1.3))))
 '(org-level-1 ((t (:inherit outline-1 :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.2))))
 '(org-level-3 ((t (:inherit outline-3 :height 1.1))))
 '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
 '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
 '(org-todo-keywords ((t (:inherit outline-1 :height 1.4)))))

;; UI configurations
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)
(global-linum-mode 1)
(add-to-list 'default-frame-alist '(font . "Cascadia Code 11"))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))
(setq visible-bell nil
      ring-bell-function #'ignore)

;; Vim mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1))

;; Anzu for search matching
(use-package anzu
  :ensure t
  :config
  (global-anzu-mode 1)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-set-key [remap query-replace] 'anzu-query-replace))

;; Theme
(use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-dracula t))

;; Helm
(use-package helm
  :ensure t
  :init
  (setq helm-M-x-fuzzy-match t
	helm-mode-fuzzy-match t
	helm-buffers-fuzzy-matching t
	helm-recentf-fuzzy-match t
	helm-locate-fuzzy-match t
	helm-semantic-fuzzy-match t
	helm-imenu-fuzzy-match t
	helm-completion-in-region-fuzzy-match t
	helm-candidate-number-list 80
	helm-split-window-in-side-p t
	helm-move-to-line-cycle-in-source t
	helm-echo-input-in-header-line t
	helm-autoresize-max-height 0
	helm-autoresize-min-height 20)
  :config
  (helm-mode 1))

;; RipGrep
(use-package helm-rg :ensure t)

;; Projectile
(use-package projectile
  :ensure t
  :init
  (setq projectile-require-project-root nil)
  :config
  (projectile-mode 1))

;; Helm Projectile
(use-package helm-projectile
  :ensure t
  :init
  (setq helm-projectile-fuzzy-match t)
  :config
  (helm-projectile-on))

;; All The Icons
(use-package all-the-icons
    :ensure t
    :init
    :config)

;; NeoTree
(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))


;; Which Key
(use-package which-key
  :ensure t
  :init
  (setq which-key-separator " → ")
  (setq which-key-prefix-prefix "+")
  :config
  (which-key-mode))

;; Custom keybinding
(use-package general
  :ensure t
  :config (general-define-key
  :states '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "M-SPC"
  "/"   '(helm-projectile-rg :which-key "ripgrep")
  "TAB" '(switch-to-prev-buffer :which-key "previous buffer")
  "SPC" '(helm-M-x :which-key "M-x")
  ;; Projectile
  "p" '(:ignore t :which-key "projectile")
  "pf"  '(helm-projectile-find-file :which-key "find files")
  "pp"  '(helm-projectile-switch-project :which-key "switch project")
  "pb"  '(helm-projectile-switch-to-buffer :which-key "switch buffer")
  "pr"  '(helm-show-kill-ring :which-key "show kill ring")
  ;; Files
  "f" '(:ignore t :which-key "files")
  "fs"  '(save-buffer :which-key "save")
  "ff"  '(find-file :which-key "save")

  ;; Buffers
  "b" '(:ignore t :which-key "buffers")
  "bl"  '(helm-mini :which-key "list")
  "bm"  '(buffer-menu :which-key "menu")
  "bk"  '(kill-buffer :which-key "kill")

  ;; Window
  "w" '(:ignore t :which-key "windows")
  "wl"  '(windmove-right :which-key "move right")
  "wh"  '(windmove-left :which-key "move left")
  "wk"  '(windmove-up :which-key "move up")
  "wj"  '(windmove-down :which-key "move bottom")
  "w/"  '(split-window-right :which-key "split right")
  "w-"  '(split-window-below :which-key "split bottom")
  "wx"  '(delete-window :which-key "delete window")

  ;; Org mode
  "o" '(:ignore t :which-key "org-mode")
  "oe" '(:ignore t :which-key "export")
  "oem" '(org-md-export-to-markdown :which-key "export")
  "oeh" '(org-html-export-to-html :which-key "export")
  "oel" '(org-latex-export-to-latex :which-key "export")
  "oep" '(org-beamer-export-to-pdf :which-key "export")
  "oa" '(:ignore t :which-key "agenda")
  "oa+" '(org-agenda :which-key "agenda")
  "oaa" '(org-agenda-add-note :which-key "add-note")

  "ot" '(:ignore t :which-key "table")
  "otc" '(:ignore t :which-key "calculation")
  "otc." '(org-table-calculation :which-key "calculation")
  "otcr" '(org-table-recalculate :which-key "table")
  "ote" '(org-table-edit-field :which-key "edit")
  
  ;; Quit
  "q" '(:ignore t :which-key "quit")
  "qf"  '(delete-frame :which-key "frame")
  "qq"  '(kill-emacs :which-key "quit")
  ;; NeoTree
  "t" '(:ignore t :which-key "toggle")
  "tn"  '(neotree-toggle :which-key "toggle neotree")
  ;; Others
  "tt"  '(ansi-term :which-key "open terminal")
))

;; Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))


;; Powerline
(use-package spaceline
  :ensure t
  :init
  (setq powerline-default-separator 'arrow)
  :config
  (spaceline-spacemacs-theme)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-buffer-size-on)
  (spaceline-toggle-version-control-on)
  (spaceline-toggle-window-number-on)
  (spaceline-toggle-org-clock-on)
  (spaceline-toggle-evil-state-on))

;; (use-package spaceline-all-the-icons 
;;   :after spaceline
;;   :config (spaceline-all-the-icons-theme))

;; (use-package spaceline-all-the-icons 
;;   :after spaceline
;;   :config
;;   (setq spaceline-all-the-icons-separator-type 'none)
;;   (setq spaceline-all-the-icons-primary-separator "")
;;   (setq spaceline-all-the-icons-secondary-separator "")
;;   (setq spaceline-all-the-icons-icon-set-modified 'toggle)
;;   (setq spaceline-all-the-icons-icon-set-git-stats 'arrows)
;;   (spaceline-all-the-icons-theme))
;; (spaceline-all-the-icons-theme)
;;;;;;;;;;;;;;;;;;;;;;;
;; Language Supports ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; (use-package elpy
;;              :ensure t
;;              :init
;;              (elpy-enable))
;; 
;;  (add-hook 'elpy-mode-hook
;;        (lambda()
;;      (set (make-local-varibale 'company-backends)
;;           '((company-dabbrev-code company-yasnippet elpy-company-backend)))))

(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")

(use-package company
    :ensure t
    :diminish
    :config
    (add-hook 'after-init-hook 'global-company-mode)

    (setq company-idle-delay 0)
    (use-package company-jedi
                 :ensure t
                 :config
                 (add-to-list 'company-backends 'company-jedi)))
(define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
(define-key company-active-map [tab] 'company-complete-common-or-cycle)

;; Company mode
(use-package web-mode
  :defer
  :ensure t
  :bind ("H-b" . browse-url-of-file)
  :config
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (setq web-mode-engines-alist
        '(("handlebars" . "\\.hbs\\'")))
  (defun bnb/web-mode-hook ()
    (setq web-mode-markup-indent-offset 2
          web-mode-css-indent-offset 2
          web-mode-code-indent-offset 2))
  (add-hook 'web-mode-hook 'bnb/web-mode-hook))

(use-package emmet-mode
             :ensure t
             :config
             (add-hook 'web-mode-hook 'emmet-mode)
             (add-hook 'sgml-mode-hook 'emmet-mode)
             (add-hook 'css-mode-hook 'emmet-mode))


;; JavaScript
(use-package js2-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

(use-package web-beautify
             :ensure t
             :bind (:map web-mode-map
                         ("C-c b" . web-beautify-html)
                         :map js2-mode-map
                         ("C-c b" . web-beautify-js)))



(use-package w3m
             :ensure t)

(use-package notmuch
             :ensure t)

(use-package google-this
             :ensure t)

;; (add-to-list 'load-path
;;              "~/.emacs.d/plugins/yasnippet")
;; (require 'yasnippet)
;; (yas-global-mode 1)
 

;; emmet mode for html css
;; (use-package impatient-mode
;;              :ensure t
;;              :mode "\\.html\\'"
;;              :config
;;              (add-to-list 'imp-default-user-filters '(mhtml-mode . nil)))


;; Rust
;; (use-package rust-mode
;;   :ensure t
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode)))

 ;; Typescript
(use-package typescript-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (magit which-key web-mode web-beautify w3m use-package typescript-mode tern spaceline-all-the-icons prettier-js notmuch neotree lsp-ui js2-refactor impatient-mode helm-rg helm-projectile google-this general flycheck evil emmet-mode elpy doom-themes company-lsp company-jedi anzu ac-js2))))
