from __future__ import print_function
import xlrd

wb = xlrd.open_workbook(
    './Differentiation Tree Dataset/differentiation-tree-all-variables.1.xlsx')
sheet = wb.sheet_by_name('RelativeSize')

# Column indices
PARENT = 1
CHILDA = 2
CHILDB = 3
LARGER = 4
ASYMMETRIC = 5

ROW_OFFSET = 1
LARGE_LABEL = 'L'
SMALL_LABEL = 'S'
ASYM_LABEL = 'A'
SAME_LABEL = 'Z'

existing_idents = set()


def idgen(x):
    z = '|'.join(str(y) for y in x)
    s = hash(z)
    if s == 3163574879612140193:
        print(z)
    if s in existing_idents:
        raise Exception("Possible identity hash collision with "
                        "data='{}' and hash={}".format(z, s))
        s += 1
    existing_idents.add(s)
    return s


def g(sheet, row, idx):
    return sheet.cell_value(row + ROW_OFFSET, idx)


def p(ident, s, t):
    print("{},{},{}".format(ident, s, t))


def pi(s, t, label):
    p(idgen((s, t)), s, t)


def c(i, l):
    print("{},{}".format(i, l))


def lol(do_edges):
    if do_edges:
        p('id', 'source', 'target')
    else:
        c('id', 'label')

    for row_num in range(0, sheet.nrows - ROW_OFFSET):
        print(row_num +ROW_OFFSET+1)
        larger = g(sheet, row_num, LARGER)
        is_asymmetric = (g(sheet, row_num, ASYMMETRIC) == 1)
        parent = g(sheet, row_num, PARENT)
        a = g(sheet, row_num, CHILDA)
        b = g(sheet, row_num, CHILDB)

        if larger != 'X' and not is_asymmetric:
            if len(a) == 0 or len(b) == 0:
                raise Exception(
                    "One or both child cells are empty"
                    " for a symmetrical division on row {}."
                    " Values are {}".format(
                        row_num + ROW_OFFSET + 1,
                        (parent, a, b, larger, is_asymmetric)))
            alabel = LARGE_LABEL if larger == 'A' else SMALL_LABEL
            blabel = LARGE_LABEL if larger == 'B' else SMALL_LABEL
            if do_edges:
                pi(parent, a, alabel)
                pi(parent, b, blabel)
            else:
                c(a, alabel)
                c(b, blabel)

        elif is_asymmetric:
            if len(a) > 0 and len(b) == 0:
                if do_edges:
                    pi(parent, a, ASYM_LABEL)
                else:
                    c(a, ASYM_LABEL)
            elif len(b) > 0 and len(a) == 0:
                if do_edges:
                    pi(parent, b, ASYM_LABEL)
                else:
                    c(b, ASYM_LABEL)
            elif len(a) > 0 and len(b) > 0:
                raise Exception(
                    "Asymmetrical division has 2 children on row {}".format(
                        row_num +
                        ROW_OFFSET +
                        1))
        elif len(a) > 0 and len(b) > 0:
            if do_edges:
                pi(parent, a, SAME_LABEL)
                pi(parent, b, SAME_LABEL)
            else:
                c(a, SAME_LABEL)
                c(b, SAME_LABEL)


if __name__ == '__main__':
    lol(True)
