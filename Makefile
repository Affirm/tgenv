.PHONY: release

PKG_NAME := "tgenv-affirm"

release:
	@which gh >/dev/null || >&2 echo "Please install gh CLI with \"brew install gh\""
	@which brew >/dev/null || >&2 echo "Please install Homebrew https://brew.sh/"
ifndef RELEASE
	$(error "RELEASE env var is undefined")
endif
ifndef PKG_NAME
	$(error "PKG_NAME makefile var is undefined")
endif
	@echo "Creating release for $$RELEASE"
	@git tag "$$RELEASE" || >&2 echo "Tag $$RELEASE already exists, creating release for tag"
	@mkdir -p ./dist
	@tar -czvf "./dist/$(PKG_NAME).tar.gz" .* --exclude ./dist
	@sha256sum "./dist/$(PKG_NAME).tar.gz"
	@gh release create --repo Affirm/tgenv "$$RELEASE" --verify-tag "./dist/$(PKG_NAME).tar.gz"
	@echo "Please update brew formula url and sha256"

