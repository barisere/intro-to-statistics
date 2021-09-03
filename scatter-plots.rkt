#lang racket

(require math)

(require plot)

(plot-new-window? #t)

(define (scatter-plot xs ys label xmin xmax ymin ymax)
  (points (map vector xs ys)
  #:x-min xmin
  #:x-max xmax
  #:y-min ymin
  #:y-max ymax
  #:line-width 4
  #:label label))

(define (diffs xs ys)
  (let ([xys (map (λ (x y) (cons x y)) xs ys)])
    (foldl (λ (v _)
             (cons (remainder (cdr v) (* 30 (car v))) _))
           (list 0)
           xys)))

(define house-sizes (list 1700 2100 1900 1300 1600 2200))

(define prices-per-sq-ft (map (λ (x) (* x 1000)) (list 53 44 59 82 50 68)))


(plot (scatter-plot house-sizes prices-per-sq-ft "House prices" 1000 3000 40000 100000)
      #:x-label "Size (sq ft)"
      #:y-label "Price")

;; Scatter plots can visualise simple relationships between data points,
;; but they don't work well with noise. To cope with noise, we use
;; tools that can visualise aggregate/cummulative data, such as bar charts
;; pie charts, and histograms.
;; Bar charts aggregate 2D data, while histograms and pie charts aggregate 1D data.
