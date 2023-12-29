;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Damon Lee"
      user-mail-address "damon@kry10.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka Nerd Font" :size 16))
(setq doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font"))
(setq doom-big-font (font-spec :family "Iosevka Nerd Font"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(global-visual-line-mode t)

(setq-default tab-width 4)

;; Line wrap everywhere and don't indent
(+global-word-wrap-mode +1)

(use-package! projectile
  :config
  (setq projectile-indexing-method 'alien)
  :config
  (projectile-register-project-type 'sel4 '("SEL4_PROJECT")
                                    :compilation-dir "build"
                                    :compile "nix-shell --run 'cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON . && ln -r -s -f compile_commands.json ../compile_commands.json && ninja' ../default.nix")
  :config
  (projectile-register-project-type 'org '("ORG")
                                    :compilation-dir "temp"
                                    :compile ""))

;; (use-package! counsel
;;   :config
;;   (define-key! [remap projectile-compile-project] #'projectile-compile-project))

(with-eval-after-load 'projectile
  (require 'f)
  (defun my-ignore-work-projects (project-root)
    (f-descendant-of? project-root (expand-file-name "~/documents/work/kos/projects")))
  (setq projectile-ignored-project-function #'my-ignore-work-projects))

(defun my-git-commit-setup ()
  (setq fill-column 72))
(add-hook! 'git-commit-setup-hook 'my-git-commit-setup)
(setq git-commit-summary-max-length 50)

(setq org-log-done 'time)
(setq org-todo-keywords '((sequence "TODO(t)" "INPROGRESS(i)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)" "DELEGATED(g)")))
(setq org-adapt-indentation t
      org-hide-leading-stars t
      org-odd-levels-only t)

(setq cmake-tab-width 4)

(use-package! magit
  :config
  (define-key magit-mode-map (kbd "q") (lambda () (interactive) (magit-mode-bury-buffer t))))

(with-eval-after-load 'evil
  (require 'evil)
  (defadvice forward-evil-paragraph (around default-values activate)
    (let ((paragraph-start (default-value 'paragraph-start))
          (paragraph-separate (default-value 'paragraph-separate)))
      ad-do-it)))

(after! rustic
  (setq rustic-lsp-server 'rust-analyzer))

(setq lsp-clients-clangd-args '("-j=3"
                                "--background-index"
                                "--completion-style=detailed"
                                "--header-insertion=never"
                                "--header-insertion-decorators=0"))
(after! lsp-clangd (set-lsp-priority! 'clangd 2))
