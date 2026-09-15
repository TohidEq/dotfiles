import os
import re
from pathlib import Path

INPUT_FILE  =   Path("/home/arc/.config/window_manager/dwl_config_maker/i_config.def.h")
OUTPUT_FILE =   Path("/home/arc/.config/window_manager/dwl_config_maker/o_config.def.h")

IMPORT_PATTERN = re.compile(r'^//\s*import:\s*"(.+?)"\s*$')


def resolve_import(raw: str, base_dir: Path) -> Path:
    # expand ~ , $VAR
    expanded = os.path.expandvars(os.path.expanduser(raw))
    p = Path(expanded)
    #
    if not p.is_absolute():
        p = base_dir / p
    return p.resolve()


def expand(input_path: Path, output_path: Path) -> None:
    with input_path.open("r") as src, output_path.open("w") as dst:
        for line in src:
            dst.write(line)
            # check imported file
            match = IMPORT_PATTERN.match(line.rstrip("\n"))
            if match:
                dst.write("// __.---==/ import start \\==---.__ //\n\n")
                imported_path = resolve_import(match.group(1), input_path.parent)
                content = imported_path.read_text()
                dst.write(content)
                if not content.endswith("\n"):
                    dst.write("\n")
                dst.write("\n// ====--__\\  import end  /__--==== //\n\n")


expand(INPUT_FILE, OUTPUT_FILE)
