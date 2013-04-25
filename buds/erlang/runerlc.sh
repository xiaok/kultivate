#!/bin/sh
export PATH=$PATH:$HOME/programs/otp/develop/bin

# to beam
erlc compiler.erl

# to beam with native
erlc +native compiler.erl

# to core erlang
erlc +to_core compiler.erl

# to 'S'
erlc +"'S'" compiler.erl

# to 'E'
erlc +"'E'" compiler.erl

# to 'P'
erlc +"'P'" compiler.erl

# disasmbler
erl -eval 'erts_debug:df(compiler), halt()'
