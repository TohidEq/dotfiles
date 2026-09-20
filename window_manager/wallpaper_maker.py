from PIL import Image
import numpy as np

def add_black_border_mono(input_path, output_path, border_size=18):
    img = Image.open(input_path)

    if img.mode in ("RGBA", "LA") or (img.mode == "P" and "transparency" in img.info):
        img = img.convert("RGBA")
        background = Image.new("RGB", img.size, (255, 255, 255))
        background.paste(img, mask=img.split()[-1])
        img = background
    else:
        img = img.convert("RGB")

    img = img.resize((1920, 1080), Image.Resampling.LANCZOS)
    img = img.convert("L")

    arr = np.array(img)
    h, w = arr.shape[:2]

    ######################
    ## draw black borders:
    #arr[0:border_size, :] = 0 # top
    #arr[h - border_size:h, :] = 0 # bottom
    arr[:, 0:border_size] = 0 # left
    arr[:, w - border_size:w] = 0 # right
 
    img_out = Image.fromarray(arr, mode="L")
    img_out.save(output_path)

if __name__ == "__main__":
    add_black_border_mono(
        "/home/arc/Pictures/wallpapers/supernatural-death-rgb.png",
        "/home/arc/Pictures/wallpapers/current-papers/supernatural-death-mono.png")
