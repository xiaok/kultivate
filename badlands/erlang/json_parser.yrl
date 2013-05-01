%% -*- erlang -*-

Nonterminals
object list kvpair kvpairs values value.

Terminals
'{' '}' '[' ']' ':' ','
'string' 'integer' 'float'
'atom'. % atom for null

Rootsymbol object.

list ->
    '[' ']' : [].
list ->
    '[' values ']' : '$2'.
values ->
     value : ['$1'].
values ->
     value ',' values : ['$1' | '$3'].

object ->
    '{' '}' : {object, []}.
object ->
    '{' kvpairs '}' : {object, '$2'}.

kvpairs ->
    kvpair : ['$1'].
kvpairs ->
    kvpair ',' kvpairs : ['$1'| '$3'].

kvpair ->
    string ':' value : {'$1', '$3'}.

value ->
    atom : 'null'.
value ->
    string : '$1'.
value ->
    integer : '$1'.
value ->
    float : '$1'.
value ->
    list : '$1'.
value ->
    object : '$1'.
