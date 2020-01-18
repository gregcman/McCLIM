(defparameter *data* '
  (
   ;;undefined functions from quickloading
   (MEZZANO.GUI::%COLOUR-MATRIX-MULTIPLY
    MEZZANO.GUI.WIDGETS::ASCENDER
    MEZZANO.GUI.WIDGETS::CHARACTER-TO-GLYPH
    MEZZANO.SUPERVISOR:CURRENT-FRAMEBUFFER
    MEZZANO.SUPERVISOR:CURRENT-THREAD
    MEZZANO.SUPERVISOR:FIFO-PUSH
    MEZZANO.SUPERVISOR:FRAMEBUFFER-BLIT
    MEZZANO.SUPERVISOR:FRAMEBUFFER-HEIGHT
    MEZZANO.SUPERVISOR:FRAMEBUFFER-WIDTH
    MEZZANO.GUI.WIDGETS::GLYPH-ADVANCE
    MEZZANO.GUI.WIDGETS::GLYPH-MASK
    MEZZANO.GUI.WIDGETS::GLYPH-XOFF
    MEZZANO.GUI.WIDGETS::GLYPH-YOFF
    MEZZANO.GUI.WIDGETS::LINE-HEIGHT
    MEZZANO.INTERNALS:LOG-AND-IGNORE-ERRORS
    MEZZANO.SYNC:MAILBOX-RECEIVE
    MEZZANO.SYNC:MAILBOX-SEND

    )

   ;;undefined functions from compiling mcclim-mezzano c-c c-c

   (CLIM-MEZZANO-OS:CURRENT-FRAMEBUFFER
    CLIM-MEZZANO-OS:DEBUG-PRINT-LINE
    CLIM-MEZZANO-OS:FIFO-POP
    CLIM-MEZZANO-OS:FIFO-PUSH
    CLIM-MEZZANO-OS:FRAMEBUFFER-HEIGHT
    CLIM-MEZZANO-OS:FRAMEBUFFER-WIDTH
    CLIM-MEZZANO-OS:MAKE-FIFO
    CLIM-MEZZANO-OS:MAKE-THREAD
    CLIM-MEZZANO-OS:PANIC)

   ;;widgets
   (MEZZANO.GUI.WIDGETS::ASCENDER
    MEZZANO.GUI.WIDGETS::CHARACTER-TO-GLYPH
    MEZZANO.GUI.WIDGETS::GLYPH-ADVANCE GLYPH-MASK
    MEZZANO.GUI.WIDGETS::GLYPH-XOFF
    MEZZANO.GUI.WIDGETS::GLYPH-YOFF
    MEZZANO.GUI.WIDGETS::LINE-HEIGHT)
   ;;compositor
   (MEZZANO.SUPERVISOR:CURRENT-FRAMEBUFFER
    MEZZANO.SUPERVISOR:CURRENT-THREAD
    MEZZANO.SUPERVISOR:FIFO-PUSH
    MEZZANO.SUPERVISOR:FRAMEBUFFER-BLIT
    MEZZANO.SUPERVISOR:FRAMEBUFFER-HEIGHT
    MEZZANO.SUPERVISOR:FRAMEBUFFER-WIDTH
    MEZZANO.INTERNALS:LOG-AND-IGNORE-ERRORS
    MEZZANO.SYNC:MAILBOX-RECEIVE MEZZANO.SYNC:MAILBOX-SEND)))

;;Go through the MCCLIM FIXME in compositor, make a mailbox
;;Write an implementation of %Colour-matrix-multiply

(defun undefined-symbols ()
  (sort (remove-duplicates (reduce 'append *data* :initial-value nil))
	'string<
	:key (lambda (x)
	       (package-name (symbol-package x)))))

(
 #+(or)
 MEZZANO.GUI::%COLOUR-MATRIX-MULTIPLY
 ;; MEZZANO.GUI.WIDGETS::GLYPH-MASK
 ;; MEZZANO.GUI.WIDGETS::LINE-HEIGHT
 ;; MEZZANO.GUI.WIDGETS::ASCENDER
 ;; MEZZANO.GUI.WIDGETS::CHARACTER-TO-GLYPH
 ;; MEZZANO.GUI.WIDGETS::GLYPH-ADVANCE
 ;; MEZZANO.GUI.WIDGETS::GLYPH-XOFF
 ;; MEZZANO.GUI.WIDGETS::GLYPH-YOFF
 ;; MEZZANO.GUI.WIDGETS::LINE-HEIGHT
 
 MEZZANO.INTERNALS:LOG-AND-IGNORE-ERRORS

 MEZZANO.SUPERVISOR:CURRENT-FRAMEBUFFER
 MEZZANO.SUPERVISOR:CURRENT-THREAD
 MEZZANO.SUPERVISOR:DEBUG-PRINT-LINE
 MEZZANO.SUPERVISOR:PANIC
 MEZZANO.SUPERVISOR:MAKE-THREAD
 MEZZANO.SUPERVISOR:MAKE-FIFO
 MEZZANO.SUPERVISOR:FIFO-POP
 MEZZANO.SUPERVISOR:FIFO-PUSH
 MEZZANO.SUPERVISOR:FRAMEBUFFER-BLIT
 MEZZANO.SUPERVISOR:FRAMEBUFFER-HEIGHT 
 MEZZANO.SUPERVISOR:FRAMEBUFFER-WIDTH 

 MEZZANO.SYNC:MAILBOX-RECEIVE
 MEZZANO.SYNC:MAILBOX-SEND
 MEZZANO.SYNC:MAKE-MAILBOX
 )

;;[TODO] : Link to a sucle window, render to a texture
;;[TODO] : Pipe events from sucle into McCLIM

;;for mez-event->mcclim-event
mos:key-event
mos:mouse-event
mos:window-activation-event
mos:quit-event
mos:window-close-event
mos:resize-request-event
mos:resize-event
