let vimsh = {}

function vimsh.vimsh()
  let cmd = input("\<C-m>")
  let tokens = split(cmd, ' ')
  call add(tokens, '')

  if cmd != ''
    call self[tokens[0]](tokens[1])
  endif

  call self.vimsh()
endfunction

function vimsh.echo(arg)
  echo a:arg
endfunction

function vimsh.echoval(arg)
  echo eval(a:arg)
endfunction

function vimsh.eval(arg)
  eval(a:arg)
endfunction

function vimsh.exit(arg)
  exit
endfunction

call vimsh.vimsh()
