
#lang Racket
(require 2htdp/batch-io)
(define tiempo-inicial (current-inexact-monotonic-milliseconds))
(define (resaltador txtin txtout)(begin


(define datat1 (read-lines txtin))
    ;Filtra la data para eliminar datos basura
    (define (filtering data ) (cond
                                [(empty? data) '()]
                                [(not(string=? (car data) "" )) (cons(car data) (filtering (cdr data))) ]
                                [(string=?(car data) "" ) (filtering (cdr data))]
                                )
    )

(define datat (filtering datat1))

(define dfa-mult
  (list
   (list
    (list 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1) (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1))
   (list 1)
   )
)

 
(define dfa-asig
  (list 
   (list 
    (list -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)
 
(define dfa-suma
  (list 
   (list 
    (list -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)

(define dfa-rest
  (list 
   (list 
    (list -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)
 
(define dfa-divi
  (list 
   (list 
    (list -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)
 
(define dfa-pote
  (list 
   (list 
    (list -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)

(define dfa-paiz
  (list 
   (list 
    (list -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)
 
(define dfa-pade
  (list 
   (list 
    (list -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)
 
(define dfa-sepa
  (list 
   (list 
    (list -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)

(define dfa-ente
  (list 
   (list 
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 1)
   )
)
 
(define dfa-iden
  (list 
   (list
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 1 1 1 1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1  1  1 1 1 1 1 -1 -1)
    )
   (list 1)
   )
)
 
(define dfa-come
  (list 
   (list 
    (list -1 -1 -1 -1 1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 2 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 -1)
    (list 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2)
    )
   (list 2)
   )
)

(define dfa-real
  (list 
   (list 
    (list -1 -1 -1 1 -1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 3 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 3 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 2 -1 -1 -1 -1 -1 3 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 4 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 4 -1 -1 -1 5 -1 -1 -1)
    (list -1 -1 6 6 -1 -1 -1 -1 -1 7 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 7 -1 -1 -1 -1 -1 -1 -1)
    (list -1 -1 -1 -1 -1 -1 -1 -1 -1 7 -1 -1 -1 -1 -1 -1 -1)
    )
   (list 4 7)
   )
)


(define (determina-grupo linea)
  (cond
    [(equal? (string-ref linea 0) #\*) 0]
    [(equal? (string-ref linea 0) #\=) 1]
    [(equal? (string-ref linea 0) #\+) 2]
    [(equal? (string-ref linea 0) #\-) 3]
    [(equal? (string-ref linea 0) #\/) 4]
    [(equal? (string-ref linea 0) #\^) 5]
    [(equal? (string-ref linea 0) #\() 6]
    [(equal? (string-ref linea 0) #\)) 7]
    [(equal? (string-ref linea 0) #\ ) 8]
    [(and (>= (char->integer (string-ref linea 0)) 48) (<= (char->integer (string-ref linea 0)) 57)) 9]
    [(equal? (string-ref linea 0) #\_) 10]
    [(and (>= (char->integer (string-ref linea 0)) 65) (<= (char->integer (string-ref linea 0)) 90)) 11]
    [(and (>= (char->integer (string-ref linea 0)) 97) (<= (char->integer (string-ref linea 0)) 100)) 12]
    [(equal? (string-ref linea 0) #\e) 13]
    [(and (>= (char->integer (string-ref linea 0)) 102) (<= (char->integer (string-ref linea 0)) 122)) 14]
    [(equal? (string-ref linea 0) #\.) 15]
    [else 16]
    )
)

(define (recorre-dfa dfa linea)
  (define (ciclo estado tabla finales linea-reducida linea-original estado-final-alcanzado pos-aceptada pos-actual)
    (if (string=? linea-reducida "")
        (if (= estado-final-alcanzado -1) #f (substring linea-original 0 (+ pos-aceptada 1)))
        (cond

          [(= (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) -1) (if (= estado-final-alcanzado -1) #f (substring linea-original 0 (+ pos-aceptada 1)))]
          [(member (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) finales) (ciclo (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) tabla finales (substring linea-original (+ pos-actual 1)) linea-original (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) pos-actual (+ pos-actual 1))]
          [else (ciclo (list-ref (list-ref tabla estado) (determina-grupo linea-reducida)) tabla finales (substring linea-original (+ pos-actual 1)) linea-original estado-final-alcanzado pos-aceptada (+ pos-actual 1))]
          )
        )
    )
  (ciclo 0 (car dfa) (car (cdr dfa)) linea linea -1 -1 0)
  )

(define (tokens-en-linea-v2 linea)
  (if (not (string=? linea "")) 
      (cond
        [(recorre-dfa dfa-iden linea) (begin
                                        (append (list (recorre-dfa dfa-iden linea) "Variable")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-iden linea)))))
                                        )
                                      ]
        [(recorre-dfa dfa-real linea) (begin
                                        (append (list (recorre-dfa dfa-real linea) "Real")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-real linea)))))
                                        )
                                      ]
        
        [(recorre-dfa dfa-ente linea) (begin
                                        (append (list (recorre-dfa dfa-ente linea) "Entero")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-ente linea)))))
                                        )
                                      ]
        [(recorre-dfa dfa-come linea) (begin
                                        (append (list (recorre-dfa dfa-come linea) "Comentario")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-come linea)))))
                                        )
                                      ]
        
        [(recorre-dfa dfa-mult linea) (begin
                                        (append (list (recorre-dfa dfa-mult linea) "Multiplicación")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-mult linea)))))
                                        )
                                      ]
        [(recorre-dfa dfa-asig linea) (begin
                                        (append (list (recorre-dfa dfa-asig linea) "Asignación")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-asig linea)))))
                                        )
                                      ]
        
        [(recorre-dfa dfa-suma linea) (begin
                                        (append (list (recorre-dfa dfa-suma linea) "Suma")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-suma linea)))))
                                        )
                                      ]
        [(recorre-dfa dfa-rest linea) (begin
                                        (append (list (recorre-dfa dfa-rest linea) "Resta")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-rest linea)))))
                                        )
                                      ]
        
        [(recorre-dfa dfa-divi linea) (begin
                                        (append (list (recorre-dfa dfa-divi linea) "División")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-divi linea)))))
                                        )
                                      ]
        [(recorre-dfa dfa-paiz linea) (begin
                                        (append (list (recorre-dfa dfa-paiz linea) "Paréntesis que abre")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-paiz linea)))))
                                        )
                                      ]
        
        [(recorre-dfa dfa-pade linea) (begin
                                        (append (list (recorre-dfa dfa-pade linea) "Paréntesis que cierra")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-pade linea)))))
                                        )
                                      ]
        [(recorre-dfa dfa-pote linea) (begin
                                        (append (list (recorre-dfa dfa-pote linea) "Potencia")
                                              (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-pote linea)))))
                                        )
                                      ]
        
        [(recorre-dfa dfa-sepa linea) (begin
                                        (recorre-dfa dfa-sepa linea)
                                        (tokens-en-linea-v2 (substring linea (string-length (recorre-dfa dfa-sepa linea))))
                                        )
                                      ]
        [else (string-append " Error, carácter no reconocido" )]
        )
      '()
      )
  )

(define final (string-join datat " "))
(define textout (string-join(tokens-en-linea-v2 final) "\n"))
(write-file txtout textout) 
)
)


 (define (tokenizador status)
   (begin
     (define pathsentrada "")
     (define pathsalida "")
     (cond
       [(equal? status 1) (begin
                            (for ([i (in-range 1 101)])
                              (set! pathsentrada (string-append "./Carpeta1/archivoentrada" (number->string i) ".txt" ))
                              (set! pathsalida (string-append "./Carpeta1/Archivos_de_Salida/archivosalida" (number->string i) ".txt" ))
                              (resaltador pathsentrada pathsalida)
                              )
                             (+ 1 0)
                              )]
       [(equal? status 2)(begin 
              (for ([i (in-range 1 101)])
         (set! pathsentrada (string-append "./Carpeta2/archivoentrada" (number->string i) ".txt" ))
         (set! pathsalida (string-append "./Carpeta2/Archivos_de_Salida/archivosalida" (number->string i) ".txt" ))
                          (resaltador pathsentrada pathsalida)
         )        
         )        
         ]       
         )     ))

(for ([i (in-range 1 3)])
(tokenizador i)
)
(define tiempo-final(current-inexact-monotonic-milliseconds))
(- tiempo-final tiempo-inicial)
