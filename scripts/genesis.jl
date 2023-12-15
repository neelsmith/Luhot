using Luhot


dirlist = [
    joinpath(pwd(), "datasets", "tanach_rules"),
    joinpath(pwd(), "datasets", "genesis"),
]
ds = filesDataset(dirlist)

parser = stringParser(ds)

pa