
"""
A Luhot dataset in a local file system.  

# Members

- `dirs` is a list of full paths to the root directory of one or more datasets, that is, a root directory with a subdirectory organization must follow Luhot's specifications.

"""
struct FilesDataset <: Luhot.Dataset
    dirs
end



"""Read all stem data from a `Kanones.FilesDataset` into an array of `Stem`s.

$(SIGNATURES)
"""
function stemsarray(dirlist; delimiter = "|")
    stemsarr = Stem[]
    pattern  = r".cex$"
    for datasrc in dirlist     
        for dirname in STEMS_DIRECTORIES 
            delimitedreader = (STEMS_IO_DICT[dirname])
            dir = joinpath(datasrc, dirname)
        
            if isdir(dir)
                for (root, dirs, files) in walkdir(dir)
                    @debug("r/d/f", root, dirs, files)
                    for f in files
                        if occursin(pattern, f) 
                            @debug("==>Reading file", joinpath(root,f))
                            raw = readlines(joinpath(root, f))
                            # Trim lines first:
                            lines = filter(s -> ! isempty(s), raw)
                            @debug("Read datalines", length(lines))
                            for i in 2:length(lines)
                                try
                                    stem = readstemrow(delimitedreader, lines[i]; delimiter = delimiter)
                                    #@debug("==>READ STEM", stem)
                                    push!(stemsarr,stem)
                                catch e
                                    @warn("Failed to parse stem data from line $(lines[i]) in file $(f)")
                                    @warn("Error: $(e)")
                                end
                                
                            end
                        end
                    end
                end
            end
        end
    end
    stemsarr
    
end