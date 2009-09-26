-module (web_index).
-include_lib ("nitrogen/include/wf.inc").
-compile(export_all).

main() -> 
  #template { file="./wwwroot/template.html"}.

title() ->
  "To Do List".
right() ->
  linecount:render().

body() -> [

  #label{ id=update, text="" },
  #textbox {id=taskText, text=""},
  #button {text="Submit", postback=addTask},

  #p{},
  #span { text="Tasks:"},

  #p{}
].

event(addTask) ->
  [Message] = wf:q(taskText),
  wf:flash( #span { id=task_item, text=Message } ),
  ok;

event(_) ->
  ok.