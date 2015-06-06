#! /usr/bin/env hy

(import [os [chdir environ getenv listdir pathsep system]])
(import sh)

(setv path_blacklist ["" "/sbin" "/usr/sbin"])

(setv path (list-comp
  directory
  [directory (.split (get environ "PATH") pathsep)]
  (not (in directory path_blacklist))))

(setv path_contents (flatten (list-comp (listdir directory) [directory path])))

(setv executables_blacklist ["hy" "sh"])

(setv executables (list-comp
  executable
  [executable path_contents]
  (not (in executable executables_blacklist))))

(setv resolvable_executables (list-comp
  (.replace executable "-" "_")
  [executable executables]
  (not (in "." executable))))

(for [executable resolvable_executables]
  (assoc (locals) executable (getattr sh executable)))

(defreader $ [envvar] (.get environ envvar (.format "Variable {} is not set" envvar)))

(defreader > [command] (system command))

(defreader ~ [relpath] (+ (get environ "HOME") relpath))

(defn editor [filename] (system (+ (.get environ "EDITOR" "nano")  " " filename)))

(setv ls (.bake ls "-F"))

(setv la (.bake ls "-a" "-F"))

(setv ll (.bake ls "-l"))
