SUBLIST = 0
SUPERLIST = 1
EQUAL = 2
UNEQUAL = 3

def check_lists(list1, list2):
    if list1 == list2:
        return EQUAL
    elif list1 in all_sublists(list2, len(list1)):
        return SUBLIST
    elif list2 in all_sublists(list1, len(list2)):
        return SUPERLIST
    else:
        return UNEQUAL

def all_sublists(list, size):
    return [list[i: i + size] for i in range(len(list) - size + 1)]
