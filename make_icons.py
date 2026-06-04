from PIL import Image, ImageDraw

C1 = (91, 140, 255)   # #5b8cff
C2 = (255, 91, 140)   # #ff5b8c

def lerp(a, b, t):
    return tuple(int(a[i] + (b[i] - a[i]) * t) for i in range(3))

def make(size, path):
    ss = 4
    S = size * ss
    img = Image.new("RGB", (S, S))
    px = img.load()
    # diagonalny gradient
    for y in range(S):
        for x in range(S):
            t = (x + y) / (2 * (S - 1))
            px[x, y] = lerp(C1, C2, t)
    d = ImageDraw.Draw(img)
    w = lambda v: v * S  # frakcja -> piksele
    white = (255, 255, 255)
    # paski filmowe (3 zaokraglone kwadraciki po lewej)
    dot_w, dot_h = w(0.055), w(0.07)
    dot_x = w(0.285)
    for cy in (0.36, 0.5, 0.64):
        y0 = w(cy) - dot_h / 2
        d.rounded_rectangle([dot_x, y0, dot_x + dot_w, y0 + dot_h],
                            radius=w(0.012), fill=white + (255,))
    # trojkat play
    d.polygon([(w(0.42), w(0.33)), (w(0.69), w(0.5)), (w(0.42), w(0.67))], fill=white)
    img = img.resize((size, size), Image.LANCZOS)
    img.save(path)
    print("zapisano", path)

make(192, "icon-192.png")
make(512, "icon-512.png")
