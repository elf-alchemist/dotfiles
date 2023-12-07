(setq byte-compile-warnings '(cl-function))

(setq inhibit-splash-screen t)
(menu-bar-mode -1)

(electric-pair-mode 1)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(setq )

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(load-theme 'atom-one-dark t)

(use-package lsp-mode
  :init (setq lsp-keymap-prefix "C-c l")
  :commands (lsp lsp-deferred)
)

(use-package lsp-ui
  :commands lsp-ui-mode
)
