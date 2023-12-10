hdr = "stem|lexeme|root|class\n"
# e.g.:
# verbs.BDB4250|bdb.BDB4250|כתב|sound

f = joinpath(pwd(), "cexcollections", "verbs-bdb-hebrew.cex")
verbdata = filter(ln -> ! isempty(ln), readlines(f)[2:end])

idrootprs = map(verbdata) do row
    cols = split(row, "|")
    (id = cols[1], root = cols[4])
end

luhotlines = map(idrootprs) do ln
    string("verbs.", ln.id, "|bdb.", ln.id, "|", ln.root, "|sound")
end

open("bdbverbs.cex", "w") do io
    write(io, hdr * join(luhotlines, "\n"))
end