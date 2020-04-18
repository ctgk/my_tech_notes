(function(win, doc){
    win.MathJax = {
        TeX: {
            Macros: {
                bm: ["{\\boldsymbol{#1}}", 1],
                dd: ["{\\frac{\\partial #1}{\\partial #2}}", 2]
            }
        }
    }
})(window, document);
