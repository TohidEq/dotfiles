<div align="center">
<h1>dwlb2</h1>

A fast, feature-complete bar for [dwl](https://github.com/djpohly/dwl).

![screenshot 1](/screenshot1.png "screenshot 1")
![screenshot 2](/screenshot2.png "screenshot 2")
</div>

## Dependencies
* libwayland-client
* libwayland-cursor
* pixman
* fcft

## Installation
```bash
git clone https://github.com/kolunmi/dwlb2
cd dwlb2
make
make install
```

## Usage
Pass `dwlb2` as an argument to dwl's `-s` flag. This will populate each connected output with a bar. For example:
```bash
dwl -s 'dwlb2 -font "monospace:size=16"'
```

## Ipc
If dwl is [patched](https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/ipc) appropriately, dwlb2 is capable of communicating directly with dwl. When ipc is enabled with `-ipc`, dwlb2 does not read from stdin, and clicking tags functions as you would expect. Ipc can be disabled with `-no-ipc`.

## Commands
Command options send instructions to existing instances of dwlb2. All commands take at least one argument to specify a bar on which to operate. This may be zxdg_output_v1 name, "all" to affect all outputs, or "selected" for the current output.

### Status Text
The `-status` and `-title` commands are used to write status text. The text may contain in-line commands in the following format: `^cmd(argument)`.

| In-Line Command     | Description                                                                 |
|---------------------|-----------------------------------------------------------------------------|
| `^fg(HEXCOLOR)`     | Sets foreground color to `HEXCOLOR`.                                        |
| `^bg(HEXCOLOR)`     | Sets background color to `HEXCOLOR`.                                        |
| `^lm(SHELLCOMMAND)` | Begins or terminates left mouse button region with action `SHELLCOMMAND`.   |
| `^mm(SHELLCOMMAND)` | Begins or terminates middle mouse button region with action `SHELLCOMMAND`. |
| `^rm(SHELLCOMMAND)` | Begins or terminates right mouse button region with action `SHELLCOMMAND`.  |
| `^us(SHELLCOMMAND)` | Begins or terminates mouse scroll up region with action `SHELLCOMMAND`.     |
| `^ds(SHELLCOMMAND)` | Begins or terminates mouse scroll down region with action `SHELLCOMMAND`.   |

In this example, clicking the text highlighted in red will spawn the [foot](https://codeberg.org/dnkl/foot) terminal.
```bash
dwlb2 -status all 'text ^bg(ff0000)^lm(foot)text^bg()^lm() text'
```

A color command with no argument reverts to the default value. `^^` represents a single `^` character. Status commands can be disabled with `-no-status-commands`.

## Scaling
If you use scaling in Wayland, you can specify `buffer_scale` through config file or by passing it as an option (only integer values):
```bash
dwlb2 -scale 2
```
This will render both surface and a cursor with 2x detail. If your monitor is set to 1.25 or 1.5 scaling, setting scale to 2 will also work as compositor will downscale the buffer properly.

## Other Options
Run `dwlb2 -h` for a full list of options.

## Someblocks
To use someblocks, or any program that outputs to stdout, with dwlb2, use this one-liner:
```bash
someblocks -p | dwlb2 -status-stdin all
```

## Acknowledgements
* [dtao](https://github.com/djpohly/dtao)
* [somebar](https://sr.ht/~raphi/somebar/)
