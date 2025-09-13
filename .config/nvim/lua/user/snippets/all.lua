local ls = require("luasnip")

return {
	s(
		"curtime",
		f(function()
			return os.date("%d/%m/%Y - %H:%M")
		end)
	),
	ls.parser.parse_snippet("foo", [[¯\_(ツ)_/¯]]),
	s("ctfa", t("customer_tax_financial_account")),
	s("CTFA", t("CustomerTaxFinancialAccount")),
	s("stfa", t("supplier_tax_financial_account")),
	s("STFA", t("SupplierTaxFinancialAccount")),
	s("tfa", t("tax_financial_account")),
	s("TFA", t("TaxFinancialAccount")),
	s("trx", t("transaction")),
	s("Trx", t("Transaction")),
}
