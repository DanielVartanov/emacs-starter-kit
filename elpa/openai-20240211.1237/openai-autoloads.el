;;; openai-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from openai.el

(defvar openai-debug-mode nil "\
Non-nil if Openai-Debug mode is enabled.
See the `openai-debug-mode' command
for a description of this minor mode.")
(custom-autoload 'openai-debug-mode "openai" nil)
(autoload 'openai-debug-mode "openai" "\
Turn on/off debug mode for `openai'.

This is a global minor mode.  If called interactively, toggle the
`Openai-Debug mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='openai-debug-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(autoload 'openai-key-auth-source "openai" "\
Retrieve the OpenAI API key from auth-source given a BASE-URL.
If BASE-URL is not specified, it defaults to `openai-base-url'.

(fn &optional BASE-URL)")
(register-definition-prefixes "openai" '("openai-"))


;;; Generated autoloads from openai-audio.el

(autoload 'openai-audio-create-transcription "openai-audio" "\
Send transcribe audio request.

Argument FILE is audio file to transcribe, in one of these formats: mp3, mp4,
mpeg, mpga, m4a, wav, or webm.  CALLBACK is the execuation after request is
made.

Arguments BASE-URL, PARAMETERS, CONTENT-TYPE, KEY and ORG-ID are global
options; however, you can overwrite the value by passing it in.

The rest of the arugments are optional, please see OpenAI API reference page
for more information.  Arguments here refer to MODEL PROMPT, RESPONSE-FORMAT,
TEMPERATURE, and LANGUAGE.

(fn FILE CALLBACK &key (BASE-URL openai-base-url) (PARAMETERS openai-parameters) (CONTENT-TYPE \"application/json\") (KEY openai-key) ORG-ID (MODEL \"whisper-1\") PROMPT RESPONSE-FORMAT TEMPERATURE LANGUAGE)")
(autoload 'openai-audio-create-translation "openai-audio" "\
Send translate audio request.

Argument FILE is the audio file to translate, in one of these formats: mp3,
mp4, mpeg, mpga, m4a, wav, or webm.  CALLBACK is the execuation after request
is made.

Arguments BASE-URL, PARAMETERS, CONTENT-TYPE, KEY and ORG-ID are global
options; however, you can overwrite the value by passing it in.

The rest of the arugments are optional, please see OpenAI API reference page
for more information.  Arguments here refer to MODEL PROMPT, RESPONSE-FORMAT,
and TEMPERATURE.

(fn FILE CALLBACK &key (BASE-URL openai-base-url) (PARAMETERS openai-parameters) (CONTENT-TYPE \"application/json\") (KEY openai-key) ORG-ID (MODEL \"whisper-1\") PROMPT RESPONSE-FORMAT TEMPERATURE)")


;;; Generated autoloads from openai-chat.el

(autoload 'openai-chat "openai-chat" "\
Send chat request.

Arguments MESSAGES and CALLBACK are required for this type of request.
MESSAGES is the conversation data.  CALLBACK is the execuation after request is
made.

Arguments BASE-URL, PARAMETERS, CONTENT-TYPE, KEY, ORG-ID and USER are global
options; however, you can overwrite the value by passing it in.

The rest of the arugments are optional, please see OpenAI API reference page
for more information.  Arguments here refer to MODEL,  TEMPERATURE, TOP-P, N,
STREAM, STOP, MAX-TOKENS, PRESENCE-PENALTY, FREQUENCY-PENALTY, and LOGIT-BIAS.

(fn MESSAGES CALLBACK &key (BASE-URL openai-base-url) (PARAMETERS openai-parameters) (CONTENT-TYPE \"application/json\") (KEY openai-key) ORG-ID (MODEL \"gpt-3.5-turbo\") TEMPERATURE TOP-P N STREAM STOP MAX-TOKENS PRESENCE-PENALTY FREQUENCY-PENALTY LOGIT-BIAS (USER openai-user))")
(autoload 'openai-chat-say "openai-chat" "\
Start making a conversation to OpenAI.

This is a ping pong message, so you will only get one response." t)
(register-definition-prefixes "openai-chat" '("openai-chat-"))


;;; Generated autoloads from openai-completion.el

(autoload 'openai-completion "openai-completion" "\
Send completion request.

Arguments PROMPT and CALLBACK are required for this type of request.  PROMPT is
either the question or instruction to OpenAI.  CALLBACK is the execution after
request is made.

Arguments BASE-URL, PARAMETERS, CONTENT-TYPE, KEY, ORG-ID and USER are global
options; however, you can overwrite the value by passing it in.

The rest of the arugments are optional, please see OpenAI API reference page
for more information.  Arguments here refer to MODEL, SUFFIX, MAX-TOKENS,
TEMPERATURE, TOP-P, N, STREAM, LOGPROBS, ECHO, STOP, PRESENCE-PENALTY,
FREQUENCY-PENALTY, BEST-OF, and LOGIT-BIAS.

(fn PROMPT CALLBACK &key (BASE-URL openai-base-url) (PARAMETERS openai-parameters) (CONTENT-TYPE \"application/json\") (KEY openai-key) ORG-ID (MODEL \"text-davinci-003\") SUFFIX MAX-TOKENS TEMPERATURE TOP-P N STREAM LOGPROBS ECHO STOP PRESENCE-PENALTY FREQUENCY-PENALTY BEST-OF LOGIT-BIAS (USER openai-user))")
(autoload 'openai-completion-select-insert "openai-completion" "\
Send the region to OpenAI and insert the result to the next paragraph.

START and END are selected region boundaries.

(fn START END)" t)
(autoload 'openai-completion-buffer-insert "openai-completion" "\
Send the entire buffer to OpenAI and insert the result to the end of buffer." t)
(register-definition-prefixes "openai-completion" '("openai-completion-"))


;;; Generated autoloads from openai-edit.el

(autoload 'openai-edit-prompt "openai-edit" "\
Prompt to ask for edited version." t)


;;; Generated autoloads from openai-engine.el

(autoload 'openai-list-engines "openai-engine" "\
List currently available (non-finetuned) models." t)
(register-definition-prefixes "openai-engine" '("openai-engine-entries"))


;;; Generated autoloads from openai-file.el

(autoload 'openai-list-files "openai-file" "\
List files that belong to the user's organization." t)
(autoload 'openai-upload-file "openai-file" "\
Prompt to upload the file to OpenAI server for file-tuning." t)
(autoload 'openai-delete-file "openai-file" "\
Prompt to select the file and delete it." t)
(autoload 'openai-retrieve-file "openai-file" "\
Prompt to select the file and print its' information." t)
(autoload 'openai-retrieve-file-content "openai-file" "\
Prompt to select the file and print its' content." t)
(register-definition-prefixes "openai-file" '("openai-"))


;;; Generated autoloads from openai-fine-tune.el

(autoload 'openai-list-fine-tunes "openai-fine-tune" "\
List fine-tuning jobs." t)
(register-definition-prefixes "openai-fine-tune" '("openai-fine-tune-entries"))


;;; Generated autoloads from openai-image.el

(autoload 'openai-image-prompt "openai-image" "\
Use PROMPT to ask for image, and display result in a buffer.

(fn PROMPT)" t)
(autoload 'openai-image-edit-prompt "openai-image" "\
Use prompt to ask for image, and display result in a buffer." t)
(autoload 'openai-image-variation-prompt "openai-image" "\
Prompt to select an IMAGE file, and display result in a buffer.

(fn IMAGE)" t)
(register-definition-prefixes "openai-image" '("openai-"))


;;; Generated autoloads from openai-model.el

(autoload 'openai-retrieve-model "openai-model" "\
Retrieves a model instance, providing basic information about the model such
as the owner and permissioning." t)
(autoload 'openai-list-models "openai-model" "\
Lists the currently available models, and provides basic information about
each one such as the owner and availability." t)
(register-definition-prefixes "openai-model" '("openai-model-entries"))

;;; End of scraped data

(provide 'openai-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; openai-autoloads.el ends here
