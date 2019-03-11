let vimsh = {}

function vimsh.vimsh()
  let cmd = input("\<C-m>VimSh > ")
  let tokens = split(cmd, ' ')
  call add(tokens, '')

  if cmd != ''
    try
      call self[tokens[0]](tokens[1])
    catch
      if tokens[1] == ''
        echomsg 'Command not found: ' . tokens[0]
      else
        echomsg 'Invalid arguments: ' . tokens[1]
      endif
    endtry
  endif

  call self.vimsh()
endfunction

function vimsh.echo(arg)
  echo a:arg
endfunction

function vimsh.echoeval(arg)
  echo eval(a:arg)
endfunction

function vimsh.eval(arg)
  eval(a:arg)
endfunction

function vimsh.exit(arg)
  exit
endfunction

call vimsh.vimsh()
