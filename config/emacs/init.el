(set-default-coding-systems 'utf-8)
(menu-bar-mode -1)
(tool-bar-mode -1)
(setq use-dialog-box nil)
(setq auto-save-default nil)
(setq make-backup-files nil)

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

(setq display-time-world-time-format "%Y-%m-%d %A %H:%M:%S")
(setq display-time-world-list
      '(("Etc/UTC" "UTC")
	("America/Fortaleza" "Brasil")
	("Japan" "Nippon")))

(setq-default mode-line-format
	      '("%b"
		(vc-mode vc-mode)))

(require 'package)
(setq package-archives
      '(("elpa" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(require 'company)
(require 'atom-one-dark-theme)

(global-company-mode)
(load-theme 'atom-one-dark t)
