# qgs
QuickGit(H)ubSearch

## What is it?
qgs is a command line tool to search GitHub in the browser.

## What does it do?
qgs opens your browser and searches GitHub for the given query.

### Example
```bash
$ BROWSER="Google Chrome" qgs org:rust-lang rust
```

Note: the `BROWSER` environment variable is used to determine which browser to use. If it is not set, `qgs` will show an error.
It is recommended to alias `qgs` to include the `BROWSER` environment variable.

## How do I install it?
```bash
curl https://raw.githubusercontent.com/michaelpeterswa/qgs/main/install_latest.sh | bash
```

Of course, be careful when piping scripts into bash, and always read the script before running it.

## How do I uninstall it?
```bash
rm /usr/local/bin/qgs
```

Cheers!