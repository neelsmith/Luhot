### A Pluto.jl notebook ###
# v0.19.36

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

# ╔═╡ 57bab4bb-6e63-4776-a85c-9d187c945b72
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

# ╔═╡ 80b7d61a-af32-11ee-1375-e704acb73d1a
md"""## Interactive parser"""

# ╔═╡ 16372cd5-294d-40cf-9d45-c5333188a2f2
md"""*Token to parse*: $(@bind token TextField())"""

# ╔═╡ edb3b930-866c-41d0-af5e-c44214e1be35
html"""
<br/><br/><br/><br/><br/>
<br/><br/><br/><br/><br/>
"""

# ╔═╡ 413e0d5c-5029-4997-a0b1-3225ed4fd4ab
md"""> **Sandbox**"""

# ╔═╡ 95ee9225-96f3-4981-b9c3-9563b980c394
md"""Try string munging ideas here"""

# ╔═╡ db5e2254-b438-4a42-a826-87adb19125a3
md"""> **Parser**"""

# ╔═╡ a72ab171-942d-4fd3-abda-61b7ebd34714
root = dirname(pwd())

# ╔═╡ 97bdd447-372d-4fbb-b930-e6e2672503b9

dirlist = [
    joinpath(root, "datasets", "tanach_rules"),
    joinpath(root, "datasets", "genesis"),
]


# ╔═╡ 636909fa-544e-4043-806a-f4d27db20ca1
ds = filesDataset(dirlist)


# ╔═╡ 189a8215-8db5-4386-8ade-6cb75837d9a2

parser = stringParser(ds)

# ╔═╡ 2a4b709c-459e-465a-b4b5-f57bd074b01b
isempty(token) ? md"" : Luhot.parsetoken(token, parser)

# ╔═╡ f7ad3683-960b-43e8-b876-451f90f3b696
md"""> **UI**"""

# ╔═╡ 4749714a-129a-403f-86d6-b93582e2a943
md"""See CSS settings in the following cell."""

# ╔═╡ b3abe9f4-164d-4c3a-a872-13d05c4296d7
@htl """
<style>
	pluto-output {
		--julia-mono-font-stack: system-ui,sans-serif;
	}
</style>
"""

# ╔═╡ Cell order:
# ╟─57bab4bb-6e63-4776-a85c-9d187c945b72
# ╟─80b7d61a-af32-11ee-1375-e704acb73d1a
# ╟─16372cd5-294d-40cf-9d45-c5333188a2f2
# ╟─2a4b709c-459e-465a-b4b5-f57bd074b01b
# ╟─edb3b930-866c-41d0-af5e-c44214e1be35
# ╟─413e0d5c-5029-4997-a0b1-3225ed4fd4ab
# ╟─95ee9225-96f3-4981-b9c3-9563b980c394
# ╟─db5e2254-b438-4a42-a826-87adb19125a3
# ╟─a72ab171-942d-4fd3-abda-61b7ebd34714
# ╟─97bdd447-372d-4fbb-b930-e6e2672503b9
# ╟─636909fa-544e-4043-806a-f4d27db20ca1
# ╟─189a8215-8db5-4386-8ade-6cb75837d9a2
# ╟─f7ad3683-960b-43e8-b876-451f90f3b696
# ╟─4749714a-129a-403f-86d6-b93582e2a943
# ╟─b3abe9f4-164d-4c3a-a872-13d05c4296d7
