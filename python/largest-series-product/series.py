import re

def largest_product(input, digits):
    largest_product = 0
    if len(re.sub("[^0-9]+", "", input)) != len(input) or digits > len(input) or digits < 0:
        raise ValueError()
    if digits == 0:
        return 1
    for index, num in enumerate(input):
        sub_nums = input[index:index+digits]
        aggregate = reduce(lambda x, y: int(x)*int(y), list(sub_nums))
        if aggregate > largest_product and len(sub_nums) == digits:
            largest_product = aggregate
    return largest_product
