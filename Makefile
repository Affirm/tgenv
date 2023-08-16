.PHONY: release

PKG_NAME := "tgenv-affirm"

release:
	@which gh >/dev/null || (>&2 echo "Please install gh CLI with \"brew install gh\"" && exit 1)
	@which brew >/dev/null || (echo "Please install Homebrew https://brew.sh/" && exit 1)
ifndef RELEASE
	$(error "RELEASE env var is undefined")
endif
ifndef PKG_NAME
	$(error "PKG_NAME makefile var is undefined")
endif
	@echo "Creating release for $$RELEASE"
	@git tag "$$RELEASE" && git push origin "$$RELEASE" || >&2 echo "Tag $$RELEASE already exists, creating release for tag"
	@mkdir -p ./dist
	@tar --exclude-from .gitignore --exclude-vcs -czvf "./dist/$(PKG_NAME).tar.gz" *
	@sha256sum "./dist/$(PKG_NAME).tar.gz"
	@gh release create --repo Affirm/tgenv --title "$$RELEASE" --notes-file CHANGELOG.md --verify-tag "$$RELEASE" "./dist/$(PKG_NAME).tar.gz" || >&2 echo "Release $$RELEASE already exists, doing nothing"
	@echo "Please update brew formula: url and sha256"

