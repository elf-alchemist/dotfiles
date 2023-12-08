(menu-bar-mode -1)
(tool-bar-mode -1)
(setq use-dialog-box nil)

(setq history-length 50)
(savehist-mode t)
(save-place-mode t)

(setq custom-file (locate-user-emacs-file "custom-vars.el"))
(load custom-file 'noerror 'nomessage)

(setq-default truncate-lines t)
(global-hl-line-mode t)
(electric-pair-mode t)

(global-auto-revert-mode t)
(setq global-auto-revert-non-file-buffers t)

(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

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
