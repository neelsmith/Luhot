### A Pluto.jl notebook ###
# v0.19.32

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

	Pkg.add("HypertextLiteral")
	using HypertextLiteral
	md"""*Unhide this cell to see the Julia environment.*"""
end

# ╔═╡ 7b5429dd-ef31-4a98-96ee-49c12f22de07
begin
	nbversion = "1.1.0"
	md"""*Notebook version*: **$(nbversion)**.  *See version info*: $(@bind versioninfo CheckBox())"""
end

# ╔═╡ bb0321d7-838d-4447-b3ac-7d3dddcd0879
if versioninfo
	md"""
- **1.1.0**: include display of BDB ID
- **1.0.0**: initial release supports display of all forms of a selected tense for a selected verb; allows optional display of *BDB* article for the selected verb. Tweaks default CSS for Pluto so that full Hebrew range of Unicode is displayed.
"""	
end

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

# ╔═╡ c2353672-6c9b-4507-9f9b-6d2f98f44843
"""Look up lemma for BDB article with a given id."""
function lemma(id, bdbarticles)
	filter(art -> art.id == id, bdbarticles)[1].lemma
end

# ╔═╡ 7b1380f6-43bd-4cce-ade6-ba3b0b2f4a08
verbmenu = map(bdb -> bdb.id => bdb.lemma, bdbarticles)

# ╔═╡ d5bf261d-6e81-4bef-b138-1566e7c6a2b6
md"""Choose a tense and a verbstem from a list of **$(length(verbmenu)) verb stems** quarried from *BDB* lexicon."""

# ╔═╡ ed448cf2-1dbd-4f96-9577-a901a0390bb3
md"""*Verb*: $(@bind vrb Select(verbmenu, default = "BDB7394")) *Tense*: $(@bind tns Select(["perfect", "imperfect", "imperative"])) *Show BDB article for verb*: $(@bind showbdb CheckBox())"""

# ╔═╡ 772bae28-6d6b-4db6-9ea2-77ac5c419b5f
md"""### Conjugation of $(lemma(vrb, bdbarticles)) in the $(tns)"""

# ╔═╡ 61473c7e-1789-47d3-87b5-bda305a147ac
md"""(*BDB identifier*: **$(vrb)**)"""

# ╔═╡ b520d59a-049c-4974-937c-f3f7961ec655
# ╠═╡ show_logs = false
conjugation_md(lemma(vrb, bdbarticles), hmpTense(tns)) |> Markdown.parse

# ╔═╡ 0c0d991d-6c2e-4892-8c6a-d3c2b85f2739
if showbdb
	mdtext = "> " * filter(article -> article.id == vrb, bdbarticles)[1].article

	replace(mdtext, "¶" => "\n>\n>") |> Markdown.parse
end

# ╔═╡ 4eb0f4a4-e7b7-4b01-a959-d3b11f3ac260
md"""> **UI**

The following (hidden) cell hijacks Pluto CSS to get fonts including pointed Hebrew.
"""

# ╔═╡ 4af6193a-9787-41a0-b6e5-eb7035f1321d
@htl """
<style>
	pluto-output {
		--julia-mono-font-stack: system-ui,sans-serif;
	}
</style>
"""

# ╔═╡ Cell order:
# ╟─2c42462a-0516-4c18-a9c0-99782b543ce5
# ╟─7b5429dd-ef31-4a98-96ee-49c12f22de07
# ╟─bb0321d7-838d-4447-b3ac-7d3dddcd0879
# ╟─f3aa400c-9800-11ee-2d39-417338333971
# ╟─d5bf261d-6e81-4bef-b138-1566e7c6a2b6
# ╟─ed448cf2-1dbd-4f96-9577-a901a0390bb3
# ╟─772bae28-6d6b-4db6-9ea2-77ac5c419b5f
# ╟─61473c7e-1789-47d3-87b5-bda305a147ac
# ╟─b520d59a-049c-4974-937c-f3f7961ec655
# ╟─0c0d991d-6c2e-4892-8c6a-d3c2b85f2739
# ╟─995c5348-db6e-40db-8f8f-646865d4324b
# ╟─e0c3e0ff-8e6c-4cf4-831c-437c5cd93446
# ╟─90dd4ee2-8c79-468a-8961-0c6cff85461f
# ╟─c0efa1e7-fc1d-4973-be80-22407510ccde
# ╟─c2353672-6c9b-4507-9f9b-6d2f98f44843
# ╟─7b1380f6-43bd-4cce-ade6-ba3b0b2f4a08
# ╟─4eb0f4a4-e7b7-4b01-a959-d3b11f3ac260
# ╟─4af6193a-9787-41a0-b6e5-eb7035f1321d
