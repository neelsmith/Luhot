
"""
A Luhot dataset in a local file system.  

# Members

- `dirs` is a list of full paths to the root directory of one or more datasets, that is, a root directory with a subdirectory organization must follow Luhot's specifications.

"""
struct FilesDataset <: Luhot.Dataset
    dirs
end


"""Construct a `FilesDataset` from a single directory name for the
location of the dataset."""
function filesDataset(s::S) where S <: AbstractString
    FilesDataset([s])
end

"""Construct a `FilesDataset` from a list of directory names for the
location of multiple datasources to combine in one dataset."""
function filesDataset(v)
    FilesDataset(v)
end

"""Read all stem data from a `Kanones.FilesDataset` into an array of `Stem`s.

$(SIGNATURES)
"""
function stemsarray(ds::FilesDataset; delimiter = "|")
    stemsarr = Stem[]
    pattern  = r".cex$"
    for datasrc in ds.dirs     
        @debug("Reading stems from $(datasrc)")
        for dirname in STEMS_DIRECTORIES 
            
            #delimitedreader = (STEMS_IO_DICT[dirname])
            delimitedtype = (STEMS_IO_DICT[dirname])
            dir = joinpath(datasrc, dirname)
            @debug("Looking for data in $(dir)")
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
                            for ln in lines[2:end]
                                if !isempty(ln)
                                    try
                                        stem = fromcex(ln, delimitedtype; delimiter = delimiter)
                                        push!(stemsarr,stem)
                                    catch e
                                        @warn("Failed to parse stem data from line $(ln) in file $(f)")
                                        @warn("Error: $(e)")
                                    end
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