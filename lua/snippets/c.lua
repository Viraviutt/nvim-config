-- C snippets. LuaSnip format. Diseñados para C23.
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
		dscr = "int main(void)",
	}, {
		t("int main(void)"),
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
		i(1, "stdio.h"),
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
		trig = "printf",
		dscr = "printf(\"...\\n\")",
	}, {
		t("printf(\""),
		i(1),
		t("\\n\");"),
	}),

	s({
		trig = "scanf",
		dscr = "scanf(\"...\", &var)",
	}, {
		t("scanf(\""),
		i(1, "%d"),
		t("\", "),
		i(2, "&var"),
		t(");"),
	}),

	s({
		trig = "forr",
		dscr = "for (size_t i = 0; ...)",
	}, {
		t("for (size_t "),
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
		trig = "foreach",
		dscr = "for (auto x : container) (C23 typeof)",
	}, {
		t("for (typeof("),
		i(1, "arr[0]"),
		t(") "),
		i(2, "x"),
		t(" : "),
		i(3),
		t(") {"),
		t({ "", "\t" }),
		i(4),
		t({ "", "}" }),
	}),

	s({
		trig = "struct",
		dscr = "typedef struct",
	}, {
		t("typedef struct {"),
		t({ "", "\t" }),
		i(1),
		t({ "", "} " }),
		i(2, "Name"),
		t(";"),
	}),

	s({
		trig = "enum",
		dscr = "typedef enum",
	}, {
		t("typedef enum {"),
		t({ "", "\t" }),
		i(1),
		t({ "", "} " }),
		i(2, "Name"),
		t(";"),
	}),

	s({
		trig = "fn",
		dscr = "function definition",
	}, {
		t("static "),
		i(1, "int"),
		t(" "),
		i(2, "name"),
		t("("),
		i(3),
		t(") {"),
		t({ "", "\t" }),
		i(4),
		t({ "", "}" }),
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
		t({ "", "", "#endif" }),
	}),

	s({
		trig = "pragma",
		dscr = "#pragma once",
	}, {
		t("#pragma once"),
	}),

	s({
		trig = "nullptr",
		dscr = "(void*)0 alias",
	}, {
		t("NULL"),
	}),

	s({
		trig = "static_assert",
		dscr = "_Static_assert (C23)",
	}, {
		t("_Static_assert("),
		i(1),
		t(", \""),
		i(2),
		t("\");"),
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
