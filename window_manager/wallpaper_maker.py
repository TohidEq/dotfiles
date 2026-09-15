from PIL import Image
import numpy as np

def add_black_border(input_path, output_path, border_size=18):
    """
    Args:
        input_path (str)
        output_path (str)
        border_size (int)
    """
    img = Image.open(input_path)
    img_resized = img.resize((1920, 1080), Image.Resampling.LANCZOS)
    arr = np.array(img_resized)
    h, w = arr.shape[:2]

    ## draw black borders:
    #arr[0:border_size, :] = 0 # top
    #arr[h - border_size:h, :] = 0 # bottom
    #arr[:, 0:border_size] = 0 # left
    #arr[:, w - border_size:w] = 0 # right
    
    img_out = Image.fromarray(arr)
    img_out.save(output_path)

if __name__ == "__main__":

    add_black_border("/home/arc/Pictures/wallpapers/item-nature-bw-1.jpg", "/home/arc/Pictures/wallpapers/current-papers/item-nature-bw-1-resized.jpg")
    add_black_border("/home/arc/Pictures/wallpapers/item-nature-bw-2.jpg", "/home/arc/Pictures/wallpapers/current-papers/item-nature-bw-2-resized.jpg")
    add_black_border("/home/arc/Pictures/wallpapers/item-nature-bw-3.jpg", "/home/arc/Pictures/wallpapers/current-papers/item-nature-bw-3-resized.jpg")
    add_black_border("/home/arc/Pictures/wallpapers/item-nature-bw-4.jpg", "/home/arc/Pictures/wallpapers/current-papers/item-nature-bw-4-resized.jpg")
