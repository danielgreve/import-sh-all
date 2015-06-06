# Use Hy as a Lispy pseudo-shell with `sh`

## How to run

First confirm Hy and the sh module is installed, or install with pip.

```hy
hy -i import-sh-all.hy
```

## Examples

```
=> (git "add" "README.md")

=> (echo #$"USER")
daniel

=> (ls #~"/Projects/hy/import-sh-all")
LICENCE.md              README.md               import-sh-all.hy

=> 
```

## Why would you want to do this?

Honestly, you likely would not unless you really enjoy typing parentheses and quotes. Plus, `sh` does not implement interactive applications [yet](https://github.com/amoffat/sh/issues/92), so vim and the like would not be available unless you defined functions for them like so:

```
(defun vim [filename]
  (os.system (.format "nvim {}" filename)))

```

Otherwise, `sh` and Hy make scripting fun and easy.

## Further reading

* `sh` [documentation](https://amoffat.github.io/sh/)
* [Inspiration for this project](https://twitter.com/paultag/status/314925996442796032)
* Hy [documentation](http://docs.hylang.org/en/latest/index.html)
* [scsh](https://github.com/scheme/scsh)
