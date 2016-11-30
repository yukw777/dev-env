let g:syntastic_javascript_checkers = ['jshint']
if getcwd() =~ '/Etsyweb\(/\|$\)'
    let g:syntastic_javascript_checkers = ['jshint', "eslint"]
    let g:syntastic_javascript_eslint_exec = "/usr/lib/node_modules/etsy-eslint/node_modules/.bin/eslint"
    let g:syntastic_javascript_eslint_args='--config /usr/lib/node_modules/etsy-eslint/config.json'
endif
