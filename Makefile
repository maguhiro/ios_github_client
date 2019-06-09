#
# ヘルプ
#
.PHONY: help
help:
	@ echo '■使い方'
	@ echo '  make setup               # セットアップ'
	@ echo '  make config              # ファイル生成'
	@ echo '  make bundle              # bundle install'
	@ echo '  make mint                # mint bootstrap'
	@ echo '  make carthage-bootstrap  # carthage bootstrap'
	@ echo '  make carthage-update     # carthage update'
	@ echo '  make pod                 # pod install'
	@ echo '  make ack                 # Acknowledgements生成'
	@ echo '  make lint                # lintチェック'
	@ echo '  make code-format         # コードフォーマット'

#
# セットアップ
#
.PHONY: setup
setup: bundle mint pod carthage-bootstrap

#
# ファイル生成
#
.PHONY: config
config:
	./bin/fastlane ios generate_config

#
# Bundler
#
.PHONY: bundle
bundle:
	bundle install

#
# Mint
#
.PHONY: mint
mint:
	mint bootstrap

#
# Carthage
#
.PHONY: carthage-bootstrap
carthage-bootstrap:
	mint run carthage/carthage carthage bootstrap --platform ios --cache-builds

.PHONY: carthage-update
carthage-update:
	mint run carthage/carthage carthage update --platform ios --cache-builds

#
# CocoaPods
#
.PHONY: pod
pod:
	./bin/fastlane ios cocoapods_install

#
# Acknowledgements生成
#
.PHONY: ack
ack:
	./bin/fastlane ios generate_ack

#
# SwiftLint
#
.PHONY: lint
lint:
	mint run realm/SwiftLint swiftlint lint

#
# SwiftFormat
#
.PHONY: code-format
code-format:
	mint run nicklockwood/SwiftFormat swiftformat . --cache ./cache/swiftformat/cache.swiftformat
