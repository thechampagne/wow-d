# wow-d

[![](https://img.shields.io/github/v/tag/thechampagne/wow-d?label=version)](https://github.com/thechampagne/wow-d/releases/latest) [![](https://img.shields.io/github/license/thechampagne/wow-d)](https://github.com/thechampagne/wow-d/blob/main/LICENSE)

D binding for **wow-cgo**.

### Download
[DUB](https://code.dlang.org/packages/wow/)

```
dub add wow
```

### API

```d
alias Spinner = spinner_t;

alias Name = name_t;

Spinner* spinnerGet(Name name);

void spinnerClean(Spinner* spinner);

class Wow
{
    this(Spinner* s, string text);

    void persist();

    void persistWith(Spinner* s, string text);

    void spinner(Spinner* s);

    void start();

    void stop();

    void text(string text);

    ~this();
}
```

### References
 - [wow-cgo](https://github.com/thechampagne/wow-cgo)

### License

This repo is released under the [MIT](https://github.com/thechampagne/wow-d/blob/main/LICENSE).