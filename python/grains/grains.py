def on_square(square):
    if square == 1:
        return 1
    else:
        return on_square(square - 1) * 2

def total_after(square):
    if square == 1:
        return 1
    else:
        grains = 0
        for n in range(1, square + 1):
            grains += on_square(n)
        return grains
