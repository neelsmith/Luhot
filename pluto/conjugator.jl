### A Pluto.jl notebook ###
# v0.19.35

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
end

# ╔═╡ 2c42462a-0516-4c18-a9c0-99782b543ce5
# ╠═╡ show_logs = false
begin
	using Pkg
	Pkg.activate(pwd() |> dirname)
	using Luhot
	Pkg.add("PlutoUI")
	
	using PlutoUI
	md"""*Unhide this cell to see the Julia environment.*"""
end

# ╔═╡ e6a349c4-e4e0-4d08-8186-9b122139290e
md"""!!! warn "Font deficiencies!"
    Need to add custom CSS to that display of tables uses a reasonable font! Pluto's default doeasn't show vowel points or accents.
"""

# ╔═╡ f3aa400c-9800-11ee-2d39-417338333971
md"""# Verb conjugator"""

# ╔═╡ 995c5348-db6e-40db-8f8f-646865d4324b
html"""
<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
"""

# ╔═╡ e0c3e0ff-8e6c-4cf4-831c-437c5cd93446
md"""> **BDB**"""

# ╔═╡ 90dd4ee2-8c79-468a-8961-0c6cff85461f
bdbfile = joinpath(pwd() |> dirname, "cexcollections", "verbs-bdb-hebrew.cex")

# ╔═╡ c0efa1e7-fc1d-4973-be80-22407510ccde
bdbarticles = map(readlines(bdbfile)[2:end]) do ln

	bdbcols = split(ln, "|")
	(id = bdbcols[1], lemma = bdbcols[4], article = bdbcols[5])

end

# ╔═╡ aa3231aa-6a54-405f-bfa2-4ac527f1a18e
verbmenu = map(bdb -> bdb.lemma, bdbarticles)

# ╔═╡ d5bf261d-6e81-4bef-b138-1566e7c6a2b6
md"""Choose a tense and a verbstem from a list of **$(length(verbmenu)) verb stems** quarried from *BDB* lexicon."""

# ╔═╡ ed448cf2-1dbd-4f96-9577-a901a0390bb3
md"""*Verb*: $(@bind vrb Select(verbmenu)) *Tense*: $(@bind tns Select(["perfect", "imperfect"])) *Show BDB article for verb*: $(@bind showbdb CheckBox())"""

# ╔═╡ b520d59a-049c-4974-937c-f3f7961ec655
# ╠═╡ show_logs = false
conjugation_md(vrb, hmpTense(tns)) |> Markdown.parse

# ╔═╡ 0c0d991d-6c2e-4892-8c6a-d3c2b85f2739
if showbdb
	mdtext = "> " * filter(article -> article.lemma == vrb, bdbarticles)[1].article

	replace(mdtext, "¶" => "\n>\n>") |> Markdown.parse
end

# ╔═╡ Cell order:
# ╟─e6a349c4-e4e0-4d08-8186-9b122139290e
# ╟─2c42462a-0516-4c18-a9c0-99782b543ce5
# ╟─f3aa400c-9800-11ee-2d39-417338333971
# ╟─d5bf261d-6e81-4bef-b138-1566e7c6a2b6
# ╟─ed448cf2-1dbd-4f96-9577-a901a0390bb3
# ╟─b520d59a-049c-4974-937c-f3f7961ec655
# ╟─0c0d991d-6c2e-4892-8c6a-d3c2b85f2739
# ╟─995c5348-db6e-40db-8f8f-646865d4324b
# ╟─e0c3e0ff-8e6c-4cf4-831c-437c5cd93446
# ╟─90dd4ee2-8c79-468a-8961-0c6cff85461f
# ╟─c0efa1e7-fc1d-4973-be80-22407510ccde
# ╟─aa3231aa-6a54-405f-bfa2-4ac527f1a18e
