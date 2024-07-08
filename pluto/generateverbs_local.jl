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

# ╔═╡ c2db99e7-dc25-4e86-bd78-454d34515886
# ╠═╡ show_logs = false
begin
	using Pkg
	Pkg.activate(pwd() |> dirname)
	using Luhot
	Pkg.add("PlutoUI")
	
	#Pkg.add("BiblicalHebrew")
	using Unicode
	using BiblicalHebrew
	using PlutoUI
	md"""*Unhide this cell to see the Julia environment.*"""
end

# ╔═╡ 7a4684d9-ae9c-47a2-9791-036d914875de
md"""!!! note "Local version"
    This version of the verb generator notebook is for use in a local clone of the `Luhot.jl` repository.
"""	

# ╔═╡ 807a2a54-96aa-11ee-378b-394db7f08761
md"""# Generate Biblical Hebrew verb forms"""

# ╔═╡ 4c546390-e1d7-4908-a567-e3dc5e36b47b
md"""### Define a finite verb form"""

# ╔═╡ 6d365395-bcc4-455c-880f-e7f549ad236f
md"""### Select a root"""

# ╔═╡ b2af5c82-6547-4ec2-b56b-6c84b632b59f
html"""
<br/><br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
"""

# ╔═╡ 4bd1e3d1-00ca-4fe8-b58b-c7791b339367
md"""---"""

# ╔═╡ 4747324d-3bd8-4d59-886f-f5b0d2bb4ed9
md"""> **BDB**"""

# ╔═╡ dd3406f1-b5aa-4d4f-bba0-cdc668731da9
bdbfile = joinpath(pwd() |> dirname, "cexcollections", "verbs-bdb-hebrew.cex")

# ╔═╡ 97d46486-0422-4206-adac-d37b86dada7f
bdbarticles = map(readlines(bdbfile)[2:end]) do ln

	bdbcols = split(ln, "|")
	(id = bdbcols[1], def = bdbcols[5])

end

# ╔═╡ 3c5ac535-4fd4-4f1b-996b-4b93c72ca0be
md"""Choose a root from **$(bdbarticles |> length) articles** about verbs extracted from *Brown-Driver-Briggs* lexicon.
"""

# ╔═╡ 6316c95c-c0ce-48e5-bd4e-134b2fd5fa72
md""">**Generating content**"""

# ╔═╡ f2d1543a-4014-4b71-9b45-332b699272c5
md""">**Dataset with stems**"""

# ╔═╡ 23885ff7-07b3-42ff-b341-d3555a5360c6
dsdir = joinpath(pwd() |> dirname, "datasets", "bdbquarry")

# ╔═╡ e54c7dd6-6cd6-46ac-98dd-2641ed5df379
ds = filesDataset(dsdir)

# ╔═╡ 871c7202-d2fc-4928-a0ca-0d00b7e9814c
verbstems = filter(Luhot.stemsarray(ds)) do st
	st isa Luhot.LuhotVerbStem
end

# ╔═╡ 9c887b3c-dc8a-420c-8d50-e45b019cbd12
rootsmenu = map(verbstems) do vstem
	vstem => Luhot.root(vstem)
end

# ╔═╡ 1b9478ed-e36a-453d-b5ec-d973a0c3abcb
md"""*Verb root:* $(@bind vocab Select(rootsmenu)) *Show BDB article* $(@bind bdb CheckBox())"""

# ╔═╡ 4a449798-f1e2-424e-b0be-69bb813f51c3
Markdown.parse("#### *Selected root*: $(vocab.root)")

# ╔═╡ 6a804049-3908-4caa-9660-356ab777d1c7
if bdb
	mdtext = "> " * filter(article -> article.id == vocab.lexid.objectid, bdbarticles)[1].def

	replace(mdtext, "¶" => "\n>\n>") |> Markdown.parse
	
end

# ╔═╡ 12c8c67c-634f-4633-8bf5-e4aadf3fc4ec
md"""> **UI for defining forms**"""

# ╔═╡ 3ef9ee91-c576-47d9-bf08-e1939427bc6a
patternkeys = keys(Luhot.codetopatterndict) |> collect |> sort

# ╔═╡ 3b9b0b6f-b71d-4504-b1f8-7c84c44628a4
tensekeys = keys(Luhot.codetotensedict) |> collect |> sort

# ╔═╡ f530a549-7abb-4406-b40d-5358f309cf36
personkeys = keys(Luhot.codetopersondict) |> collect |> sort |> reverse

# ╔═╡ fb9d2963-006d-431d-b208-4e0f0c6e5ca4
numberkeys = keys(Luhot.codetonumberdict) |> collect |> sort

# ╔═╡ 0fc4414e-cc7d-424b-a6b0-028f30316c1b
genderkeys = keys(Luhot.codetogenderdict) |> collect |> sort

# ╔═╡ 6b7c004d-ccc8-4fd7-a476-c265211c9e0c
patternmenu = map(patternkeys) do k
	(k => Luhot.codetopatterndict[k])
end

# ╔═╡ 1bab053b-a675-482b-95cd-dc5eb4bf5cbc
tensemenu =  map(tensekeys) do k
	(k => Luhot.codetotensedict[k])
end

# ╔═╡ 13acbbb0-b3cc-41bb-ad64-17789306cd08
md"""*Verb pattern:* $(@bind pattern Select(patternmenu)) *Tense:* $(@bind tense Select(tensemenu))"""

# ╔═╡ 450209c4-eec7-49cc-926a-b56f75b78773
personmenu =  map(personkeys) do k
	(k => Luhot.codetopersondict[k])
end

# ╔═╡ da4d51cc-a144-4986-959b-ea017db8e3ee
numbermenu =  map(numberkeys) do k
	(k => Luhot.codetonumberdict[k])
end

# ╔═╡ e1a02001-8d02-41bf-a647-65876c2aa4ac
gendermenu =  map(genderkeys) do k
	(k => Luhot.codetogenderdict[k])
end

# ╔═╡ 5eb3dc2e-0ca2-49de-8926-86228ec6fb8b
md"""*Person:* $(@bind person Select(personmenu)) *Number:* $(@bind number Select(numbermenu)) *Gender:* $(@bind gender Select(gendermenu))"""

# ╔═╡ 5ccc3cb7-a791-4735-9f7b-f604383aada4
form = if person == 1
	HebrewFiniteVerb(
	hmpPattern(pattern), hmpTense(tense),
	hmpPerson(person), hmpNumber(number), hmpGender("common")
)
else

	
	HebrewFiniteVerb(
	hmpPattern(pattern), hmpTense(tense),
	hmpPerson(person), hmpNumber(number), hmpGender(gender)
)
end

# ╔═╡ 51440ca3-ad09-42ff-b19b-17bd8ad3d538
result = generate(vocab, form)

# ╔═╡ b5277a97-47d8-4869-abc6-75102fedd697
md"""### Resulting form: $(result)"""

# ╔═╡ fe6a22f7-9f53-4f92-91e0-8873ab5be7d8
string("Composed from **", length(collect(result)),"** Unicode symbols:") |> Markdown.parse

# ╔═╡ 9de7a4a3-0bc6-4c06-bf9b-2fdf4f4e4411
result_by_codept = map(collect(result)) do ch
	string(BiblicalHebrew.codept_name(ch), " ", Char(ch))
end

# ╔═╡ f0287782-4a61-47ba-b946-70d098e46a1f
join(map(s -> string("1. ", s), result_by_codept), "\n") |> Markdown.parse

# ╔═╡ Cell order:
# ╟─c2db99e7-dc25-4e86-bd78-454d34515886
# ╟─7a4684d9-ae9c-47a2-9791-036d914875de
# ╟─807a2a54-96aa-11ee-378b-394db7f08761
# ╟─4c546390-e1d7-4908-a567-e3dc5e36b47b
# ╟─13acbbb0-b3cc-41bb-ad64-17789306cd08
# ╟─5eb3dc2e-0ca2-49de-8926-86228ec6fb8b
# ╟─6d365395-bcc4-455c-880f-e7f549ad236f
# ╟─3c5ac535-4fd4-4f1b-996b-4b93c72ca0be
# ╟─1b9478ed-e36a-453d-b5ec-d973a0c3abcb
# ╟─4a449798-f1e2-424e-b0be-69bb813f51c3
# ╟─6a804049-3908-4caa-9660-356ab777d1c7
# ╟─b5277a97-47d8-4869-abc6-75102fedd697
# ╟─fe6a22f7-9f53-4f92-91e0-8873ab5be7d8
# ╟─f0287782-4a61-47ba-b946-70d098e46a1f
# ╟─b2af5c82-6547-4ec2-b56b-6c84b632b59f
# ╟─4bd1e3d1-00ca-4fe8-b58b-c7791b339367
# ╟─4747324d-3bd8-4d59-886f-f5b0d2bb4ed9
# ╟─dd3406f1-b5aa-4d4f-bba0-cdc668731da9
# ╟─97d46486-0422-4206-adac-d37b86dada7f
# ╟─6316c95c-c0ce-48e5-bd4e-134b2fd5fa72
# ╟─51440ca3-ad09-42ff-b19b-17bd8ad3d538
# ╟─9de7a4a3-0bc6-4c06-bf9b-2fdf4f4e4411
# ╟─5ccc3cb7-a791-4735-9f7b-f604383aada4
# ╟─f2d1543a-4014-4b71-9b45-332b699272c5
# ╟─23885ff7-07b3-42ff-b341-d3555a5360c6
# ╟─e54c7dd6-6cd6-46ac-98dd-2641ed5df379
# ╟─871c7202-d2fc-4928-a0ca-0d00b7e9814c
# ╟─9c887b3c-dc8a-420c-8d50-e45b019cbd12
# ╟─12c8c67c-634f-4633-8bf5-e4aadf3fc4ec
# ╟─3ef9ee91-c576-47d9-bf08-e1939427bc6a
# ╟─3b9b0b6f-b71d-4504-b1f8-7c84c44628a4
# ╟─f530a549-7abb-4406-b40d-5358f309cf36
# ╟─fb9d2963-006d-431d-b208-4e0f0c6e5ca4
# ╟─0fc4414e-cc7d-424b-a6b0-028f30316c1b
# ╟─6b7c004d-ccc8-4fd7-a476-c265211c9e0c
# ╟─1bab053b-a675-482b-95cd-dc5eb4bf5cbc
# ╟─450209c4-eec7-49cc-926a-b56f75b78773
# ╟─da4d51cc-a144-4986-959b-ea017db8e3ee
# ╟─e1a02001-8d02-41bf-a647-65876c2aa4ac
