-- C++ snippets. LuaSnip format.
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local same = function(idx)
	return f(function(args)
		return args[1][1]
	end, idx)
end

return {
	s({
		trig = "main",
		dscr = "int main(int argc, char* argv[])",
	}, {
		t("int main(int argc, char *argv[])"),
		t({ "", "{" }),
		t({ "", "\t" }),
		i(1, "// code"),
		t({ "", "\treturn 0;" }),
		t({ "", "}" }),
	}),

	s({
		trig = "inc",
		dscr = "#include <...>",
	}, {
		t("#include <"),
		i(1),
		t(">"),
	}),

	s({
		trig = "incq",
		dscr = "#include \"...\"",
	}, {
		t("#include \""),
		i(1),
		t("\""),
	}),

	s({
		trig = "namespace",
		dscr = "namespace block",
	}, {
		t("namespace "),
		i(1, "name"),
		t({ "", "{" }),
		t({ "", "\t" }),
		i(2),
		t({ "", "} // namespace " }),
		same(1),
	}),

	s({
		trig = "class",
		dscr = "class with public section",
	}, {
		t("class "),
		i(1, "Name"),
		t({ "", "{" }),
		t({ "", "public:" }),
		t({ "", "\t" }),
		i(2, "// members"),
		t({ "", "", "};" }),
	}),

	s({
		trig = "struct",
		dscr = "struct",
	}, {
		t("struct "),
		i(1, "Name"),
		t({ "", "{" }),
		t({ "", "\t" }),
		i(2),
		t({ "", "};" }),
	}),

	s({
		trig = "tpl",
		dscr = "function template",
	}, {
		t("template <typename "),
		i(1, "T"),
		t(">"),
		t({ "", "auto " }),
		i(2, "name"),
		t("("),
		i(3),
		t(") {"),
		t({ "", "\t" }),
		i(4),
		t({ "", "}" }),
	}),

	s({
		trig = "concept",
		dscr = "concept (C++20)",
	}, {
		t("template <typename "),
		i(1, "T"),
		t(">"),
		t({ "", "concept " }),
		i(2, "ConceptName"),
		t(" = "),
		i(3, "std::integral<T>"),
		t(";"),
	}),

	s({
		trig = "requires",
		dscr = "requires clause (C++20)",
	}, {
		t("requires "),
		i(1),
	}),

	s({
		trig = "forr",
		dscr = "range-based for",
	}, {
		t("for (const auto& "),
		i(1, "item"),
		t(" : "),
		i(2, "container"),
		t(") {"),
		t({ "", "\t" }),
		i(3),
		t({ "", "}" }),
	}),

	s({
		trig = "fori",
		dscr = "indexed for",
	}, {
		t("for (std::size_t "),
		i(1, "i"),
		t(" = 0; "),
		same(1),
		t(" < "),
		i(2, "n"),
		t("; ++"),
		same(1),
		t(") {"),
		t({ "", "\t" }),
		i(3),
		t({ "", "}" }),
	}),

	s({
		trig = "unique_ptr",
		dscr = "std::make_unique",
	}, {
		t("auto "),
		i(1, "ptr"),
		t(" = std::make_unique<"),
		i(2, "Type"),
		t(">("),
		i(3),
		t(");"),
	}),

	s({
		trig = "shared_ptr",
		dscr = "std::make_shared",
	}, {
		t("auto "),
		i(1, "ptr"),
		t(" = std::make_shared<"),
		i(2, "Type"),
		t(">("),
		i(3),
		t(");"),
	}),

	s({
		trig = "try",
		dscr = "try/catch with std::exception",
	}, {
		t("try {"),
		t({ "", "\t" }),
		i(1),
		t({ "", "} catch (const std::exception& e) {" }),
		t({ "", "\tstd::cerr << e.what();" }),
		t({ "", "}"}),
	}),

	s({
		trig = "guard",
		dscr = "header guard (#ifndef)",
	}, {
		t("#ifndef "),
		i(1, "PROJECT_HEADER"),
		t("_H"),
		t({ "", "#define " }),
		same(1),
		t("_H"),
		t({ "", "", "#endif // " }),
		same(1),
		t("_H"),
	}),

	s({
		trig = "pragma",
		dscr = "#pragma once",
	}, {
		t("#pragma once"),
	}),

	s({
		trig = "constexpr",
		dscr = "constexpr function",
	}, {
		t("constexpr auto "),
		i(1, "name"),
		t("("),
		i(2),
		t(") -> "),
		i(3, "T"),
		t(" {"),
		t({ "", "\t" }),
		i(4),
		t({ "", "}" }),
	}),

	s({
		trig = "lam",
		dscr = "lambda",
	}, {
		t("[&]("),
		i(1),
		t(") {"),
		t({ "", "\t" }),
		i(2),
		t({ "", "};" }),
	}),

	s({
		trig = "out",
		dscr = "std::cout << ... << std::endl",
	}, {
		t("std::cout << "),
		i(1),
		t(" << std::endl;"),
	}),

	s({
		trig = "range",
		dscr = "std::ranges::...",
	}, {
		t("std::ranges::"),
		i(1, "sort"),
		t("("),
		i(2),
		t(");"),
	}),

	s({
		trig = "doc",
		dscr = "Doxygen block comment completo",
	}, {
		t("/**"),
		t({ "", " * @brief " }), i(1, "Descripcion breve."),
		t({ "", " *" }),
		t({ "", " * @param " }), i(2, "param"), t(" "), i(3, "descripcion"),
		t({ "", " * @return " }), i(4, "Tipo"), t(" "), i(5, "descripcion"),
		t({ "", " */" }),
	}),

	s({
		trig = "brief",
		dscr = "@brief inline",
	}, {
		t("/** @brief "), i(1, "Descripcion."), t(" */"),
	}),

	s({
		trig = "param",
		dscr = "@param inline",
	}, {
		t("/** @param "), i(1, "name"), t(" "), i(2, "descripcion"), t(" */"),
	}),

	s({
		trig = "return",
		dscr = "@return inline",
	}, {
		t("/** @return "), i(1, "Tipo"), t(" "), i(2, "descripcion"), t(" */"),
	}),

	s({
		trig = "todo",
		dscr = "@todo inline",
	}, {
		t("/** @todo "), i(1, "Que falta."), t(" */"),
	}),

	s({
		trig = "note",
		dscr = "@note inline",
	}, {
		t("/** @note "), i(1, "Observacion."), t(" */"),
	}),

	s({
		trig = "warning",
		dscr = "@warning inline",
	}, {
		t("/** @warning "), i(1, "Cuidado."), t(" */"),
	}),

	s({
		trig = "author",
		dscr = "@author header de archivo",
	}, {
		t("/**"),
		t({ "", " * @file " }), i(1, vim.fn.expand("%:t")),
		t({ "", " * @author " }), i(2, "tu-nombre"),
		t({ "", " * @date " }), i(3, os.date("%Y-%m-%d")),
		t({ "", " */" }),
	}),
}
