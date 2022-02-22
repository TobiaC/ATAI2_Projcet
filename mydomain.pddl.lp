%---------------------------------------
% domain
%---------------------------------------

% utils
boolean(true).
boolean(false).

% types
type(type("object")).

% variables
variable(variable("hasbox")).
variable(variable("isatstart")).
variable(variable("isatgoal")).

contains(X, value(X, B)) :- variable(X), boolean(B).

% actions
action(action("go2start")).
postcondition(action("go2start"), effect(unconditional), variable("isatstart"), value(variable("isatstart"), true)) :- action(action("go2start")).
postcondition(action("go2start"), effect(unconditional), variable("isatgoal"), value(variable("isatgoal"), false)) :- action(action("go2start")).

action(action("go2goal")).
precondition(action("go2goal"), variable("hasbox"), value(variable("hasbox"), true)) :- action(action("go2goal")).
postcondition(action("go2goal"), effect(unconditional), variable("isatgoal"), value(variable("isatgoal"), true)) :- action(action("go2goal")).
postcondition(action("go2goal"), effect(unconditional), variable("hasbox"), value(variable("hasbox"), true)) :- action(action("go2goal")).
postcondition(action("go2goal"), effect(unconditional), variable("isatstart"), value(variable("isatstart"), false)) :- action(action("go2goal")).

action(action("pick")).
precondition(action("pick"), variable("isatstart"), value(variable("isatstart"), true)) :- action(action("pick")).
postcondition(action("pick"), effect(unconditional), variable("hasbox"), value(variable("hasbox"), true)) :- action(action("pick")).
postcondition(action("pick"), effect(unconditional), variable("isatstart"), value(variable("isatstart"), true)) :- action(action("pick")).

action(action("drop")).
precondition(action("drop"), variable("hasbox"), value(variable("hasbox"), true)) :- action(action("drop")).
precondition(action("drop"), variable("isatgoal"), value(variable("isatgoal"), true)) :- action(action("drop")).
precondition(action("drop"), variable("isatstart"), value(variable("isatstart"), false)) :- action(action("drop")).
postcondition(action("drop"), effect(unconditional), variable("hasbox"), value(variable("hasbox"), false)) :- action(action("drop")).
